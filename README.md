# ABC Technologies — Corporate Website

Static corporate website for ABC Technologies (DevOps Assignment 2, Use Case 1).

## Pages
- `index.html` — Home
- `about.html` — About Us
- `services.html` — Services
- `careers.html` — Careers
- `gallery.html` — Gallery
- `contact.html` — Contact Us

## Structure
```
abc-technologies/
├── index.html
├── about.html
├── services.html
├── careers.html
├── gallery.html
├── contact.html
├── css/
│   └── style.css
├── js/
│   └── script.js
└── images/
```

## Run locally
Just open `index.html` in a browser, or serve the folder with any static
file server, e.g.:

```bash
python3 -m http.server 8080
```

Then visit `http://localhost:8080`.

## Next steps (rest of the assignment)
1. Push this folder to a GitHub repository.
2. Set up a Jenkins job/pipeline that pulls from GitHub and builds on commit.
3. Add a `Dockerfile` (e.g. `nginx:alpine` base) to containerize the site.
4. Write Kubernetes `Deployment` + `Service` (NodePort) manifests.
5. Configure Nagios, Graphite, and Grafana for monitoring.
