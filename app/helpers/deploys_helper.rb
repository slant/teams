module DeploysHelper
  def commit_link(deploy)
    link_to deploy.short_sha, deploy.github_url
  end
end
