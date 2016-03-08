class UploadFilesController < ApplicationController

  def advance
  end

  def upload
    tmp_file_path = params[:file].tempfile.path
    begin
      FileUtils.mkdir("#{Rails.root}/public/upload") unless File.exist?("#{Rails.root}/public/upload")
      FileUtils.cp tmp_file_path, "#{Rails.root}/public/upload/#{params[:file].original_filename}"
      return render text: "#{rand(999)}"
    rescue => x
      render text: x.to_s
    end
  end
end
