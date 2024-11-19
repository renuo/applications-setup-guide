// Populate the sidebar
//
// This is a script, and not included directly in the page, to control the total size of the book.
// The TOC contains an entry for each page, so if each page includes a copy of the TOC,
// the total size of the page becomes O(n**2).
class MDBookSidebarScrollbox extends HTMLElement {
    constructor() {
        super();
    }
    connectedCallback() {
        this.innerHTML = '<ol class="chapter"><li class="chapter-item expanded affix "><a href="README.html">Overview</a></li><li class="chapter-item expanded affix "><li class="part-title">General</li><li class="chapter-item expanded "><a href="create_git_repository.html"><strong aria-hidden="true">1.</strong> Create a Git Repository</a></li><li class="chapter-item expanded "><a href="gitflow.html"><strong aria-hidden="true">2.</strong> GitFlow</a></li><li class="chapter-item expanded "><a href="go_live.html"><strong aria-hidden="true">3.</strong> Go Live!</a></li><li class="chapter-item expanded "><a href="naming_conventions.html"><strong aria-hidden="true">4.</strong> Naming Conventions</a></li><li class="chapter-item expanded "><a href="security.html"><strong aria-hidden="true">5.</strong> Security</a></li><li class="chapter-item expanded "><a href="checklist.html"><strong aria-hidden="true">6.</strong> Project Checklist</a></li><li class="chapter-item expanded affix "><li class="part-title">Frameworks</li><li class="chapter-item expanded "><a href="ruby_on_rails/README.html"><strong aria-hidden="true">7.</strong> Ruby on Rails</a></li><li><ol class="section"><li class="chapter-item expanded "><div><strong aria-hidden="true">7.1.</strong> Setup</div></li><li><ol class="section"><li class="chapter-item expanded "><a href="ruby_on_rails/app_initialisation.html"><strong aria-hidden="true">7.1.1.</strong> Initialise the Rails App</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/first_git_push.html"><strong aria-hidden="true">7.1.2.</strong> Push to Git Repository</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/initialise_gitflow.html"><strong aria-hidden="true">7.1.3.</strong> Initialise Gitflow</a></li><li class="chapter-item expanded "><a href="configure_git_repository.html"><strong aria-hidden="true">7.1.4.</strong> Configure Git Repository</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/create_application_server.html"><strong aria-hidden="true">7.1.5.</strong> Create an Application Server</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/configure_ci.html"><strong aria-hidden="true">7.1.6.</strong> Configure the CI/CD</a></li></ol></li><li class="chapter-item expanded "><div><strong aria-hidden="true">7.2.</strong> Tools</div></li><li><ol class="section"><li class="chapter-item expanded "><a href="ruby_on_rails/rspec.html"><strong aria-hidden="true">7.2.1.</strong> RSpec</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/linting_and_automatic_check.html"><strong aria-hidden="true">7.2.2.</strong> Linting and automatic checks</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/suggested_libraries.html"><strong aria-hidden="true">7.2.3.</strong> Gems and libraries</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/cloudflare.html"><strong aria-hidden="true">7.2.4.</strong> Cloudflare</a></li></ol></li><li class="chapter-item expanded "><div><strong aria-hidden="true">7.3.</strong> Additional Services</div></li><li><ol class="section"><li class="chapter-item expanded "><a href="ruby_on_rails/sentry.html"><strong aria-hidden="true">7.3.1.</strong> Sentry</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/newrelic.html"><strong aria-hidden="true">7.3.2.</strong> NewRelic</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/robots_txt.html"><strong aria-hidden="true">7.3.3.</strong> Robots.txt</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/configure_percy.html"><strong aria-hidden="true">7.3.4.</strong> Percy</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/environment_protection.html"><strong aria-hidden="true">7.3.5.</strong> Protect develop environment</a></li></ol></li><li class="chapter-item expanded "><div><strong aria-hidden="true">7.4.</strong> Customer Plan Services</div></li><li><ol class="section"><li class="chapter-item expanded "><a href="ruby_on_rails/uptimerobot.html"><strong aria-hidden="true">7.4.1.</strong> Uptimerobot</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/sentry.html"><strong aria-hidden="true">7.4.2.</strong> Sentry Notifications</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/depfu.html"><strong aria-hidden="true">7.4.3.</strong> Depfu Security monitoring</a></li></ol></li><li class="chapter-item expanded "><div><strong aria-hidden="true">7.5.</strong> Gems</div></li><li><ol class="section"><li class="chapter-item expanded "><a href="ruby_on_rails/jest.html"><strong aria-hidden="true">7.5.1.</strong> Jest</a></li><li class="chapter-item expanded "><a href="slack_and_notifications.html"><strong aria-hidden="true">7.5.2.</strong> Slack and Notifications</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/send_emails.html"><strong aria-hidden="true">7.5.3.</strong> Send Emails</a></li><li class="chapter-item expanded "><a href="sparkpost_and_mailtrap.html"><strong aria-hidden="true">7.5.4.</strong> Sparkpost &amp; Mailtrap</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/devise.html"><strong aria-hidden="true">7.5.5.</strong> Devise</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/sidekiq.html"><strong aria-hidden="true">7.5.6.</strong> Sidekiq</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/cucumber.html"><strong aria-hidden="true">7.5.7.</strong> Cucumber</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/aws.html"><strong aria-hidden="true">7.5.8.</strong> Amazon S3 and Cloudfront</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/carrierwave.html"><strong aria-hidden="true">7.5.9.</strong> Carrierwave Upload</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/bootstrap.html"><strong aria-hidden="true">7.5.10.</strong> Bootstrap</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/font_awesome.html"><strong aria-hidden="true">7.5.11.</strong> FontAwesome</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/bullet.html"><strong aria-hidden="true">7.5.12.</strong> Bullet</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/appsignal.html"><strong aria-hidden="true">7.5.13.</strong> Lograge</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/hotjar.html"><strong aria-hidden="true">7.5.14.</strong> Hotjar</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/wicked_pdf.html"><strong aria-hidden="true">7.5.15.</strong> Wicked PDF</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/recaptcha.html"><strong aria-hidden="true">7.5.16.</strong> Recaptcha v3</a></li></ol></li></ol></li><li class="chapter-item expanded "><a href="js/README.html"><strong aria-hidden="true">8.</strong> Frontend apps (JS)</a></li><li class="chapter-item expanded "><a href="react_native/README.html"><strong aria-hidden="true">9.</strong> React Native</a></li><li><ol class="section"><li class="chapter-item expanded "><div><strong aria-hidden="true">9.1.</strong> Setup</div></li><li><ol class="section"><li class="chapter-item expanded "><a href="ruby_on_rails/first_git_push.html"><strong aria-hidden="true">9.1.1.</strong> Push to Git Repository</a></li><li class="chapter-item expanded "><a href="ruby_on_rails/initialise_gitflow.html"><strong aria-hidden="true">9.1.2.</strong> Initialise Gitflow</a></li><li class="chapter-item expanded "><a href="react_native/configure_ci.html"><strong aria-hidden="true">9.1.3.</strong> Configure CI</a></li><li class="chapter-item expanded "><a href="react_native/release.html"><strong aria-hidden="true">9.1.4.</strong> Release</a></li></ol></li><li class="chapter-item expanded "><div><strong aria-hidden="true">9.2.</strong> Tools</div></li><li><ol class="section"><li class="chapter-item expanded "><a href="react_native/jest.html"><strong aria-hidden="true">9.2.1.</strong> Jest</a></li><li class="chapter-item expanded "><a href="react_native/recommended_libraries.html"><strong aria-hidden="true">9.2.2.</strong> Recommended libraries</a></li><li class="chapter-item expanded "><a href="react_native/linting_and_automatic_check.html"><strong aria-hidden="true">9.2.3.</strong> Linting and automatic checks</a></li><li class="chapter-item expanded "><a href="react_native/sentry.html"><strong aria-hidden="true">9.2.4.</strong> Sentry</a></li></ol></li></ol></li><li class="chapter-item expanded "><li class="part-title">Services</li><li class="chapter-item expanded "><a href="google_analytics.html"><strong aria-hidden="true">10.</strong> Google Analytics</a></li><li class="chapter-item expanded "><a href="google_apis.html"><strong aria-hidden="true">11.</strong> Google Apis</a></li><li class="chapter-item expanded "><a href="slack_and_notifications.html"><strong aria-hidden="true">12.</strong> Slack and Notifications</a></li><li class="chapter-item expanded affix "><li class="part-title">Templates</li><li class="chapter-item expanded "><a href="templates/README.html"><strong aria-hidden="true">13.</strong> README</a></li><li class="chapter-item expanded "><a href="templates/pull_requests_template.html"><strong aria-hidden="true">14.</strong> Pull Request Template</a></li></ol>';
        // Set the current, active page, and reveal it if it's hidden
        let current_page = document.location.href.toString();
        if (current_page.endsWith("/")) {
            current_page += "index.html";
        }
        var links = Array.prototype.slice.call(this.querySelectorAll("a"));
        var l = links.length;
        for (var i = 0; i < l; ++i) {
            var link = links[i];
            var href = link.getAttribute("href");
            if (href && !href.startsWith("#") && !/^(?:[a-z+]+:)?\/\//.test(href)) {
                link.href = path_to_root + href;
            }
            // The "index" page is supposed to alias the first chapter in the book.
            if (link.href === current_page || (i === 0 && path_to_root === "" && current_page.endsWith("/index.html"))) {
                link.classList.add("active");
                var parent = link.parentElement;
                if (parent && parent.classList.contains("chapter-item")) {
                    parent.classList.add("expanded");
                }
                while (parent) {
                    if (parent.tagName === "LI" && parent.previousElementSibling) {
                        if (parent.previousElementSibling.classList.contains("chapter-item")) {
                            parent.previousElementSibling.classList.add("expanded");
                        }
                    }
                    parent = parent.parentElement;
                }
            }
        }
        // Track and set sidebar scroll position
        this.addEventListener('click', function(e) {
            if (e.target.tagName === 'A') {
                sessionStorage.setItem('sidebar-scroll', this.scrollTop);
            }
        }, { passive: true });
        var sidebarScrollTop = sessionStorage.getItem('sidebar-scroll');
        sessionStorage.removeItem('sidebar-scroll');
        if (sidebarScrollTop) {
            // preserve sidebar scroll position when navigating via links within sidebar
            this.scrollTop = sidebarScrollTop;
        } else {
            // scroll sidebar to current active section when navigating via "next/previous chapter" buttons
            var activeSection = document.querySelector('#sidebar .active');
            if (activeSection) {
                activeSection.scrollIntoView({ block: 'center' });
            }
        }
        // Toggle buttons
        var sidebarAnchorToggles = document.querySelectorAll('#sidebar a.toggle');
        function toggleSection(ev) {
            ev.currentTarget.parentElement.classList.toggle('expanded');
        }
        Array.from(sidebarAnchorToggles).forEach(function (el) {
            el.addEventListener('click', toggleSection);
        });
    }
}
window.customElements.define("mdbook-sidebar-scrollbox", MDBookSidebarScrollbox);
