module IcsHelper
   def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_ics_path
    elsif action_name == 'edit'
      ic_path
    end
   end
end
