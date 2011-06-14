Factory.define :member do |member|
  member.first_name               => "example"
  member.last_name                => "member"
  member.date_of_birth            => Date.today
  member.password                 => "000000"
  member.password_confirmation    => "000000"
end