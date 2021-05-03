ActiveAdmin.register Coach do
  permit_params :examination_interview_date_confirmed, :examination_status_id, :examination_result_date

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #

  form do |f|
    unless f.object.examination_result_date
      f.object.examination_result_date = Time.zone.today
    end

    f.inputs do
      f.input :user_id
      f.input :examination_interview_date_confirmed
      f.input :examination_status_id
      f.input :examination_result_date
    end
    f.actions
  end
end
