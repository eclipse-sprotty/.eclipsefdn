local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-sprotty') {
  settings+: {
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    name: "Eclipse Sprotty™",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('sprotty') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "A diagramming framework for the web",
      has_projects: false,
      homepage: "https://sprotty.org/",
      topics+: [
        "diagrams",
        "eclipse",
        "svg",
        "typescript",
        "visualization",
        "web"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('sprotty-previews') {
      default_branch: "previews",
      description: "Hosting PR previews for sprotty-website",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "previews",
      gh_pages_source_path: "/",
      has_issues: false,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "previews"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('sprotty-server') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Server implementation for the Sprotty diagramming framework",
      homepage: "https://eclipse.org/sprotty",
      topics+: [
        "diagrams",
        "eclipse",
        "java",
        "server"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('sprotty-theia') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Integration of Sprotty diagrams into Theia IDE",
      homepage: "https://eclipse.org/sprotty",
      topics+: [
        "diagrams",
        "eclipse",
        "ide",
        "theia"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('sprotty-vscode') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "sprotty-vscode",
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('sprotty-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Sprotty project website",
      gh_pages_build_type: "workflow",
      homepage: "https://sprotty.org/",
      topics+: [
        "diagrams",
        "documentation",
        "sprotty",
        "website"
      ],
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('DEPLOY_PREVIEW_TOKEN') {
          value: "pass:bots/ecd.sprotty/github.com/preview-token",
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
        orgs.newEnvironment('pull-request-preview'),
      ],
    },
  ],
}
