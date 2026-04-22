#!/usr/bin/env zsh

# Locale
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

# Default Editor
export EDITOR="vim"

# SSH Agent
export SSH_AUTH_SOCK="${SSH_AUTH_SOCK:-${XDG_RUNTIME_DIR}/ssh-agent.socket}"

# goenv settings
export GOENV_GOMOD_VERSION_ENABLE=1
export GOENV_AUTO_INSTALL=1

# Disable telemetry
export DO_NOT_TRACK=1 # generic
export NO_TELEMETRY=1 # generic
export AIDER_ANALYTICS=false # aider
export ALGOLIA_CLI_TELEMETRY=0 # algolia-cli
export AMPLIFY_DISABLE_TELEMETRY=1 # amplify-cli
export APOLLO_TELEMETRY_DISABLED=true # apollo
export ASTRO_TELEMETRY_DISABLED=1 # astro
export AVALONIA_TELEMETRY_OPTOUT=1 # avalonia
export AZURE_CORE_COLLECT_TELEMETRY=0 # azure-cli
export BINSTALL_DISABLE_TELEMETRY=true # cargo-binstall
export CDK_DISABLE_CLI_TELEMETRY=true # aws-cdk
export CHECKPOINT_DISABLE=1 # hashicorp
export CHECKPOINT_DISABLE=1 # prisma
export CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY=1 # claude-code
export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1 # claude-code
export CLOUDSDK_CORE_DISABLE_USAGE_REPORTING=true # google-cloud-sdk
export COCOAPODS_DISABLE_STATS=true # cocoapods
export CODER_TELEMETRY_ENABLE=false # coder
export DAGGER_NO_ANALYTICS=1 # dagger
export DENO_NO_UPDATE_CHECK=1 # deno
export DEVPOD_DISABLE_TELEMETRY=true # devpod
export DISABLE_ERROR_REPORTING=1 # claude-code
export DISABLE_EVENTS=1 # localstack
export DISABLE_FEEDBACK_COMMAND=1 # claude-code
export DISABLE_TELEMETRY=1 # claude-code
export DOTNET_CLI_TELEMETRY_OPTOUT=1 # dotnet
export DVC_NO_ANALYTICS=true # dvc
export EXPO_NO_TELEMETRY=1 # expo
export FASTLANE_OPT_OUT_USAGE=YES # fastlane
export FLOX_DISABLE_METRICS=true # flox
export GATSBY_TELEMETRY_DISABLED=1 # gatsby
export GEMINI_TELEMETRY_ENABLED=false # gemini
export GF_ANALYTICS_CHECK_FOR_PLUGIN_UPDATES=false # grafana
export GF_ANALYTICS_CHECK_FOR_UPDATES=false # grafana
export GF_ANALYTICS_REPORTING_ENABLED=false # grafana
export GH_TELEMETRY=false # github-cli
export HASURA_GRAPHQL_ENABLE_TELEMETRY=false # hasura
export HOMEBREW_NO_ANALYTICS=1 # homebrew
export INFLUXD_REPORTING_DISABLED=true # influxdb
export MEILI_NO_ANALYTICS=true # meilisearch
export MS_GOTOOLCHAIN_TELEMETRY_ENABLED=0 # microsoft-go
export N8N_DIAGNOSTICS_ENABLED=false # n8n
export NEXT_TELEMETRY_DISABLED=1 # nextjs
export NG_CLI_ANALYTICS=false # angular-cli
export NUXT_TELEMETRY_DISABLED=1 # nuxtjs
export NX_TELEMETRY_DISABLED=true # nx
export PLATFORMIO_SETTING_ENABLE_TELEMETRY=false # platformio
export POWERSHELL_TELEMETRY_OPTOUT=1 # powershell
export POWERSHELL_UPDATECHECK=Off # powershell
export PULUMI_SKIP_UPDATE_CHECK=true # pulumi
export REDWOOD_DISABLE_TELEMETRY=1 # redwood
export SAM_CLI_TELEMETRY=0 # aws-sam-cli
export SCARF_ANALYTICS=false # scarf
export SHOPIFY_CLI_NO_ANALYTICS=1 # shopify-cli
export SLS_TELEMETRY_DISABLED=1 # serverless
export SNYK_DISABLE_ANALYTICS=1 # snyk
export STEAMPIPE_TELEMETRY=none # steampipe
export STORYBOOK_DISABLE_TELEMETRY=true # storybook
export STRAPI_TELEMETRY_DISABLED=1 # strapi
export STRIPE_CLI_TELEMETRY_OPTOUT=1 # stripe-cli
export TESTINGPLATFORM_TELEMETRY_OPTOUT=1 # dotnet-testing-platform
export TURBO_TELEMETRY_DISABLED=1 # turbo
export VERCEL_TELEMETRY_DISABLED=1 # vercel
export WRANGLER_SEND_METRICS=false # wrangler
export XMAKE_STATS=false # xmake
export YARN_ENABLE_TELEMETRY=0 # yarn
