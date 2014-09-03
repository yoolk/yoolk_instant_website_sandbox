namespace :instant_website do
  namespace :attachments do
    desc 'copy attachments from db/samples to public directory'
    task copy: :environment do
      FileUtils.mkdir_p 'public/attachments'
      FileUtils.mkdir_p 'public/attachments/images'
      FileUtils.mkdir_p 'public/attachments/pdfs'

      FileUtils.cp_r    'db/samples/attachments',  'public/'
    end
  end
end