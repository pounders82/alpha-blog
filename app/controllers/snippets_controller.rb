def snippet_params
  params.require(:snippet).permit(:title, :content, :image)
end
