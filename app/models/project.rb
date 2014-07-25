class Project < ActiveRecord::Base

  def self.in_three_buckets
    #TODO MAKE THIS LESS HACKY
    bucket_1 = []
    bucket_2 = []
    bucket_3 = []

    sorted_projects.each_with_index do | project, index |
      if index % 3 == 0
        bucket_1 << project
      elsif index % 3 == 1
        bucket_2 << project
      elsif index % 3 == 2
        bucket_3 << project
      end
    end

    [bucket_1, bucket_2, bucket_3]
  end

  def self.sorted_projects
    Project.all.sort_by(&:order)
  end

  def link
    "/projects/#{slug}"
  end

	def next_proj_link
		"/projects/#{next_proj.slug}"
	end

	def prev_proj_link
		"/projects/#{prev_proj.slug}"
	end

  private

  def next_proj
    sorted_projects = Project.sorted_projects
    index = sorted_projects.map(&:id).index(id)
    p = sorted_projects[index+1]
    p || sorted_projects.first
  end

  def prev_proj
    sorted_projects = Project.sorted_projects
    index = sorted_projects.map(&:id).index(id)
    p = sorted_projects[index-1]
    p || sorted_projects.last
  end
end
