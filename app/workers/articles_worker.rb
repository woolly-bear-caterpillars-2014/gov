class ArticlesWorker
  include Sidekiq::Worker

  def perform(article_id)
    # do lots of project cleanup stuff here
  end
end

# ArticlesWorker.new.perform(@project.id)  ## NOT BACKGROUND
# ArticlesWorker.perform_async(@project.id)
ArticlesWorker.perform_at(2.days.from_now, @project.id)