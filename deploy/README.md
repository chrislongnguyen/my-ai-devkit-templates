# Deploy Skeleton — Actionable Patterns

Deployment patterns for multiple targets. Each is **actionable:** when to use it, exact commands, where secrets go, explicit environment targeting (staging vs production), post-deploy verification, and one-line rollback. **Never commit secrets** — use `.env` (gitignored) or the platform's dashboard. Covers Vercel, Railway, Cloudflare Workers, and **Google Cloud (GCP, GCS, Google Colab)** for company infrastructure.

---

## 1. Vercel (Frontend / fullstack)

**When to use:** Static sites, Next.js, React, or other frontend frameworks. Serverless functions supported.

| What you do | What the AI does for you |
| :--- | :--- |
| Sign up at vercel.com, link repo, set root directory if needed | Run `npx vercel` (preview) or `npx vercel --prod` (production); add env vars in dashboard or `.env.local` (gitignored) |
| Add env vars in Vercel dashboard (Settings → Environment Variables) for prod; use Preview for staging | Invoke `npx vercel --prod` only when you explicitly request production |
| After deploy: open the deployment URL, check build log in dashboard | Report deployment URL and build status |

**Secrets:** `.env` / `.env.local` must be gitignored. Use Vercel dashboard for production env vars. Never commit API keys.

**Environment targeting:** `npx vercel` → preview/staging; `npx vercel --prod` → production. Always confirm before prod.

**Post-deploy verification:** Open the deployment URL; check Vercel dashboard for build status and function logs.

**Rollback:** Vercel dashboard → Deployments → select previous deployment → "Promote to Production".

---

## 2. Railway (Backend / services)

**When to use:** Node, Python, Go backends; databases; background workers. Good for APIs and services.

| What you do | What the AI does for you |
| :--- | :--- |
| Sign up at railway.app, create project, connect repo | Run `railway up` (or `railway link` then `railway up`); set env vars in Railway dashboard |
| Add env vars in Railway project (Variables tab); use different projects or environments for staging vs prod | Invoke `railway up`; for prod, require explicit confirmation |
| After deploy: hit health endpoint or run smoke test | Report deploy URL and suggest a quick curl or test command |

**Secrets:** Use Railway dashboard Variables. Never commit `.env` or secrets to git.

**Environment targeting:** Use separate Railway projects or environments (e.g. "staging", "production"). Deploy to staging first; promote to prod after validation.

**Post-deploy verification:** `curl https://your-app.railway.app/health` (or your app's health route); check Railway logs.

**Rollback:** Railway dashboard → Deployments → select previous deployment → "Redeploy" or use rollback if available.

---

## 3. Cloudflare Workers (Edge)

**When to use:** Edge functions, lightweight APIs, low latency globally. Good for serverless at the edge.

| What you do | What the AI does for you |
| :--- | :--- |
| Sign up at cloudflare.com, install Wrangler (`npm i -g wrangler`), run `npx wrangler login` | Run `npx wrangler deploy`; secrets via `npx wrangler secret put <NAME>` (never in code) |
| Add secrets with `wrangler secret put`; use different workers or routes for staging vs prod | Deploy to staging/preview first; require explicit confirmation for production worker |
| After deploy: hit worker URL, check Cloudflare dashboard | Report worker URL and suggest verification step |

**Secrets:** `npx wrangler secret put <NAME>`. Never put secrets in `wrangler.toml` or committed files.

**Environment targeting:** Use `wrangler.toml` envs (e.g. `[env.staging]`, `[env.production]`) or separate worker names. Deploy with `--env staging` first.

**Post-deploy verification:** `curl https://your-worker.your-subdomain.workers.dev`; check Cloudflare Workers dashboard.

**Rollback:** Redeploy previous version from dashboard or re-run deploy from a previous git tag/commit.

---

## 4. Google Cloud (GCP) — Cloud Run / App Engine

**When to use:** Containers or source-based deploy on Google Cloud; APIs, services, or fullstack apps. Fits company infrastructure already on GCP.

| What you do | What the AI does for you |
| :--- | :--- |
| Enable Cloud Run (or App Engine) in GCP project; set up `gcloud` CLI and `gcloud auth login` | Run `gcloud run deploy` (Cloud Run) or `gcloud app deploy` (App Engine); set env vars via `--set-env-vars` or Secret Manager |
| Store secrets in Secret Manager or `.env` (gitignored); use different GCP projects or services for staging vs prod | Deploy to staging project/service first; require explicit confirmation for production |
| After deploy: hit service URL, check Cloud Console logs | Report service URL and suggest `curl` or health-check command |

**Secrets:** Use Secret Manager (`gcloud secrets create` / reference in Cloud Run) or `.env` never committed. Never put keys in Dockerfile or source.

**Environment targeting:** Use separate GCP projects (e.g. `myapp-staging`, `myapp-prod`) or Cloud Run services per environment. Deploy with `--project=myapp-staging` first; prod only after validation.

**Post-deploy verification:** `curl https://your-service-xxx.run.app` (Cloud Run) or App Engine URL; check Cloud Console → Logging.

**Rollback:** Cloud Console → Cloud Run (or App Engine) → select previous revision/version → "Manage traffic" or redeploy previous image.

---

## 5. Google Cloud Storage (GCS) — Static hosting / assets

**When to use:** Static sites (HTML/JS/CSS), generated docs, or asset buckets. Good for frontends that don’t need a server, or for company buckets.

| What you do | What the AI does for you |
| :--- | :--- |
| Create a GCS bucket, set public read (or load balancer) if needed; configure `gsutil` or `gcloud` | Run `gsutil -m rsync -r ./build gs://your-bucket` (or `gcloud storage cp`) to sync build output |
| Use different buckets or prefixes for staging vs prod (e.g. `gs://myapp-staging`, `gs://myapp-prod`) | Sync to staging bucket first; require explicit confirmation before syncing to prod bucket |
| After sync: open bucket URL or load balancer URL, confirm objects updated | Report bucket URL and suggest verification step |

**Secrets:** Don’t store secrets in uploaded objects. Use IAM and signed URLs or Cloud CDN + OAuth for private content.

**Environment targeting:** Separate buckets (`myapp-staging`, `myapp-prod`) or prefixes (`staging/`, `prod/`). Always confirm before writing to prod.

**Post-deploy verification:** `gsutil ls gs://your-bucket`; open the site URL or object URL in browser.

**Rollback:** Re-sync a previous build from git (e.g. checkout previous commit, rebuild, sync) or restore from object versioning if enabled.

---

## 6. Google Colab (Notebooks / run environment)

**When to use:** Jupyter notebooks for experiments, demos, or shared analysis. Run in the cloud without managing servers; integrates with GCP and Google Drive.

| What you do | What the AI does for you |
| :--- | :--- |
| Upload `.ipynb` to Google Drive or repo; open in Colab (colab.research.google.com) or connect repo via GitHub | Draft notebook structure, cells, and instructions; suggest "Upload to Colab" or "Open in Colab" link |
| Add secrets via Colab secrets (🔑) or env vars in notebook; use separate notebooks or copies for staging vs prod runs | Never embed API keys in committed notebooks; reference Colab secrets or prompt user to set env |
| After run: share Colab link, export to Drive or GitHub | Report Colab link and suggest how to share or re-run |

**Secrets:** Use Colab’s "Secrets" (notebook → 🔑) or mount Drive and read from a private config file. Never commit keys in `.ipynb`.

**Environment targeting:** Use separate notebooks or copies for staging (test data, dev API) vs prod (real data, prod API). Clearly label in filename or first cell.

**Post-run verification:** Re-run key cells; check outputs and logs in the notebook.

**Rollback:** Revert notebook in Drive or git; re-open previous version in Colab.

---

## Optional: `run-deploy.sh`

From repo root, run `./deploy/run-deploy.sh <target> <environment>`. **Targets:** `vercel` | `railway` | `workers` | `gcp` | `gcs`. The script delegates to the platform CLI and **requires explicit confirmation for production**. If the CLI is missing, it prints install instructions. No project-specific config — it only invokes standard CLIs.
