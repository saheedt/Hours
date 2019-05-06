module XLSXDownload
  class XlsxDownload
    def format_xlsx(user)
      output = []
      current_user = user.full_name
      user.projects.each do |project|
        project.hours.each do |hour|
          if project[:id] == hour[:project_id]
            data = {
                User: current_user,
                Project: project[:name],
                Hours: hour[:value],
                Billable: project[:billable],
                Billed: hour[:billed],
                Description: hour[:description],
                Date: hour[:date],
                Category: hour.category.label
            }
            output << data
          end
        end
      end
      output
    end
  end
end