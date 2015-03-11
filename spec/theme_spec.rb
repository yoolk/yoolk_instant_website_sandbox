require 'rails_helper'
require 'rake'
Rails.application.load_tasks

ThemesOnRails.all.each do |theme|
  theme_directory   = "app/themes/#{theme}"
  views_directory   = "#{theme_directory}/views"
  locales_directory = "#{theme_directory}/locales"
  assets_directory  = "#{theme_directory}/assets"
  theme_layout_file = "#{views_directory}/layouts/#{theme}.liquid"
  available_locales = %w(af ar az bg bn bs ca cs cy da de de-AT de-CH el en en-AU en-CA en-GB en-IE en-IN en-NZ en-US en-ZA eo es es-419 es-AR es-CL es-CO es-CR es-EC es-MX es-PA es-PE es-US es-VE et eu fa fi fr fr-CA fr-CH gl he hi hi-IN hr hu id is it it-CH ja km kn ko lo lt lv mk mn ms nb ne nl nn or pl pt pt-BR rm ro ru sk sl sr sv sw ta th tl tr uk ur uz vi wo zh-CN zh-HK zh-TW zh-YUE)

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

    it 'should invoke {{content_for_header}} inside layout file' do
      content = File.read(theme_layout_file)

      expect(content).to match(/{{\s*content_for_header\s*}}/), "layout file: `#{theme_layout_file}` should include `{{ content_for_header }}` inside <head></head> section."
    end

    it 'should invoke {{content_for_layout}} inside layout file' do
      content = File.read(theme_layout_file)

      expect(content).to match(/{{\s*content_for_layout\s*}}/), "layout file: `#{theme_layout_file}` should include `{{ content_for_layout }}` inside <body></body> section."
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

    it 'should not contains *.css.scss' do
      sass_files = Dir.glob(assets_directory + "/stylesheets/#{theme}/*/*.css.scss")

      expect(sass_files).to be_empty, "Extra .css in SCSS file is unnecessary: #{sass_files}. Rename these files to end with `.scss` only."
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
        locale     = YAML.load_file(yaml_file)
        locale_key = locale.keys.first

        expect(locale.keys.length).to           eq(1)
        expect(available_locales).to            include(locale_key)
        expect(locale[locale_key].keys).to  eq([theme])
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