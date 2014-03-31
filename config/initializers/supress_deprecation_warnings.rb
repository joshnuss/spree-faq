if Rails.env.test?
  I18n.enforce_available_locales = true
  Devise.secret_key = '8a16eeec5d770df5d6044939cd7a4d0d4bdf57d8325a87c952a7b1764ec4916d8033ebefd397d21c4f2b0da9690ff9be65bb'
  StateMachine::Machine.ignore_method_conflicts = true
end