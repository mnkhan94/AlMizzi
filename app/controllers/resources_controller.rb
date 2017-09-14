class ResourcesController < ApplicationController
  
  def add_harmony
    narration = Narration.find(params[:narration_id])
    ayah = params[:ayah] || nil
    hadith_reference = params[:hadith_reference]
    body = params[:body]
    user_id = params[:user_id]


    Resource.create(
      resourceable_type: 'narration', 
      resourceable_id: narration.id,
      ayah: ayah, 
      hadith_reference: hadith_reference,
      body: body,
      user_id: user_id,
      category: 'harmony'
    )
    head :ok, content_type: "text/html"
  end

  def get_harmonies
    @resources = Resource.where(resourceable_id: params[:id]).where(category: "harmony")
    render :json => @resources
  end

end
