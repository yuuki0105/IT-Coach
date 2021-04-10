# == Schema Information
#
# Table name: google_calendar_tokens
#
#  id                                                                              :bigint           not null, primary key
#  coach_id                                                                        :bigint           not null
#  reflesh_token(googleカレンダーへアクセスするトークンを生成処理をするために使う) :string(255)      not null
#  next_sync_token(googleカレンダーの更新された情報を最新化するために使う)         :string(255)      not null
#  created_at                                                                      :datetime         not null
#  updated_at                                                                      :datetime         not null
#
# Indexes
#
#  index_google_calendar_tokens_on_coach_id  (coach_id)
#
# Foreign Keys
#
#  fk_rails_...  (coach_id => coaches.id)
#
class GoogleCalendarToken < ApplicationRecord
  belongs_to :coach
  validates :refresh_token, presence: true
end
