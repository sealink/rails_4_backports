require "rails_4_backports/version"

module Rails4Backports
  require 'rails_4_backports/active_record_dynamic_finders'
  if ::ActiveRecord::VERSION::MAJOR == 3
    ActiveRecord::Base.send(:extend, ActiveRecordDynamicFinders)
  end
end
