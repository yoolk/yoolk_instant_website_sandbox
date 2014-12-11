require 'rails_helper'
require 'rake'
Rails.application.load_tasks

ThemesOnRails.all.delete_if { |directory| directory.start_with?('.') }.each do |theme|
  theme_directory   = "app/themes/#{theme}"
  views_directory   = "#{theme_directory}/views"
  locales_directory = "#{theme_directory}/locales"
  assets_directory  = "#{theme_directory}/assets"

  context "Theme #{theme}: view files" do
    it 'contains only liquid templates' do
      files             = Dir["#{views_directory}/**/*"].reject { |file| File.directory?(file) }
      non_liquid_files  = files.count { |file| !file.end_with?('.liquid') }

      expect(non_liquid_files).to be_zero
    end

    it 'must be valid liquid syntax' do
      files  = Dir["#{views_directory}/**/*"].reject { |file| File.directory?(file) && !file.end_with?('.liquid') }
      files.each do |file|
        validator = LiquidValidator::Validator.new(File.read(file))

        expect(validator.valid?).to be_truthy, "template: #{file}, errors: #{validator.errors}"
      end
    end
  end

  context "Theme #{theme}: directory structure" do
    it 'contains assets directory' do
      expect(File.exists?(assets_directory)).to be_truthy, "there must be `assets` directory inside #{theme}"
    end

    it 'contains all.js.coffee' do
      js_directory = assets_directory + "/javascripts/#{theme}/all*.js.coffee"

      expect(Dir.glob(js_directory)).to be_present, "there must be `all.js.coffee` inside app/themes/#{theme}/javascripts/#{theme}/"
    end

    it 'contains all.scss' do
      css_directory = assets_directory + "/stylesheets/#{theme}/all*.scss"

      expect(Dir.glob(css_directory)).to be_present, "there must be `all.scss` inside app/themes/#{theme}/stylesheets/#{theme}/"
    end

    it 'contains views directory' do
      expect(File.exists?(views_directory)).to be_truthy, "there is must be `views` directory inside #{theme}"
    end
  end

  context "Theme #{theme}: theme directory structure" do
    Dir["#{locales_directory}/*"].each do |yaml_file|
      it 'parses successfully' do
        expect { YAML.load_file(yaml_file) }.to_not raise_error
      end

      it 'contains valid keys' do
        locale = YAML.load_file(yaml_file)

        expect(locale.keys.length).to           eq(1)
        expect(I18n.available_locales).to       include(locale.keys.first.to_sym)
        expect(locale[locale.keys[0]].keys).to  eq([theme])
      end
    end
  end
end

context 'asset precompilation' do
  after(:each) { FileUtils.rm_rf('public/assets') }

  it 'passes the precompile test' do
    expect {
      ENV['RAILS_ENV'] = 'production'

      Rake::Task['assets:precompile'].invoke

      ENV['RAILS_ENV'] = 'test'
    }.to_not raise_error
  end
end