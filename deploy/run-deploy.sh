#!/usr/bin/env bash
# Optional deploy entrypoint. Usage: ./deploy/run-deploy.sh <target> <environment>
# Target: vercel | railway | workers | gcp | gcs. Environment: staging | prod.
# Requires explicit confirmation for prod. No project-specific config — delegates to platform CLIs.

set -e
TARGET="${1:-}"
ENV="${2:-staging}"

if [ -z "$TARGET" ]; then
  echo "Usage: ./deploy/run-deploy.sh <target> <environment>"
  echo "  target: vercel | railway | workers | gcp | gcs"
  echo "  environment: staging | prod (default: staging)"
  exit 1
fi

if [ "$ENV" = "prod" ]; then
  echo "You are about to deploy to PRODUCTION. Type 'yes' to confirm."
  read -r confirm
  if [ "$confirm" != "yes" ]; then
    echo "Aborted."
    exit 1
  fi
fi

case "$TARGET" in
  vercel)
    if command -v npx &>/dev/null; then
      [ "$ENV" = "prod" ] && npx vercel --prod || npx vercel
    else
      echo "Install Node.js and run: npx vercel (or npx vercel --prod for production)"
    fi
    ;;
  railway)
    if command -v railway &>/dev/null; then
      railway up
    else
      echo "Install Railway CLI: https://docs.railway.app/develop/cli"
    fi
    ;;
  workers)
    if command -v npx &>/dev/null; then
      npx wrangler deploy
    else
      echo "Install Node.js and run: npm i -g wrangler && npx wrangler deploy"
    fi
    ;;
  gcp)
    if command -v gcloud &>/dev/null; then
      gcloud run deploy
    else
      echo "Install Google Cloud CLI: https://cloud.google.com/sdk/docs/install"
    fi
    ;;
  gcs)
    if command -v gsutil &>/dev/null; then
      if [ -n "$DEPLOY_BUCKET" ]; then
        gsutil -m rsync -r . "gs://${DEPLOY_BUCKET}"
      else
        echo "Set DEPLOY_BUCKET (e.g. export DEPLOY_BUCKET=my-bucket) then re-run. Or: gsutil -m rsync -r <local-dir> gs://<bucket>"
      fi
    else
      echo "Install Google Cloud CLI (includes gsutil): https://cloud.google.com/sdk/docs/install"
    fi
    ;;
  *)
    echo "Unknown target: $TARGET. Use vercel | railway | workers | gcp | gcs"
    exit 1
    ;;
esac
