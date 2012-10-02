module DeploysHelper
  def commit_link(deploy)
    link_to deploy.sha[0...10], deploy.github_url
  end
end
