require "rails_4_backports/version"

module Rails4Backports
  if defined?(ActiveRecord)
    require 'rails_4_backports/active_record_dynamic_finders'
    if ::ActiveRecord::VERSION::MAJOR == 3
      ActiveRecord::Base.send(:extend, ActiveRecordDynamicFinders)
    end
  end

  require 'rails_4_backports/file_fixtures'

  if defined?(Rails)
    class Railtie < ::Rails::Railtie
      config.before_initialize do |app|
        require 'rails-secrets'
        app.config.secret_token ||= app.secrets.secret_key_base
      end
    end
  end
end
