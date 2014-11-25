require 'rails_helper'
require 'rake'
Rails.application.load_tasks

ThemesOnRails.all.each do |theme|
  theme_directory   = "app/themes/#{theme}"
  views_directory   = "#{theme_directory}/views"
  locales_directory = "#{theme_directory}/locales"

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

  context "Theme #{theme}: locales files" do
    Dir["#{locales_directory}/*"].each do |yaml_file|
      it 'parses successfully' do
        expect { YAML.load_file(yaml_file) }.to_not raise_error
      end

      it 'contains valid keys' do
        locale = YAML.load_file(yaml_file)

        expect(locale.keys.length).to eq(1)
        expect(locale[locale.keys[0]].keys).to eq([theme])
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