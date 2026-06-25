<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Field Ledger & Blogs | GoTrek</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&family=Lato:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        /* --- DESIGN FRAMEWORK VARIABLES --- */
        :root {
            --bg-deep: #0B1D26;
            --bg-gradient: linear-gradient(180deg, #0B1D26 0%, #0F2A38 50%, #0B1D26 100%);
            --accent-gold: #FBD784;
            --text-pure: #FFFFFF;
            --text-dim: rgba(255, 255, 255, 0.65);
            --glass-bg: rgba(255, 255, 255, 0.02);
            --glass-border: rgba(255, 255, 255, 0.06);
            --gold-glow: rgba(251, 215, 132, 0.12);
            --footer-bg: #061218;
        }

        /* --- CORE RESET --- */
        * { margin: 0; padding: 0; box-sizing: border-box; }
        html { scroll-behavior: smooth; }

        /* Webkit scrollbar styles */
        ::-webkit-scrollbar { width: 8px; }
        ::-webkit-scrollbar-track { background: var(--bg-deep); }
        ::-webkit-scrollbar-thumb { background: rgba(251, 215, 132, 0.3); border-radius: 4px; }
        ::-webkit-scrollbar-thumb:hover { background: var(--accent-gold); }

        body {
            background: var(--bg-gradient);
            color: var(--text-pure);
            font-family: 'Lato', sans-serif;
            overflow-x: hidden;
            line-height: 1.6;
            letter-spacing: 0px;
        }

        /* --- STICKY NAVIGATION --- */
        .navbar {
            position: fixed; top: 0; left: 0; width: 100%;
            display: flex; justify-content: space-between; align-items: center;
            padding: 30px 4%; z-index: 1000;
            background: rgba(11, 29, 38, 0.9);
            backdrop-filter: blur(20px); -webkit-backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.04);
            transition: all 0.5s cubic-bezier(0.25, 1, 0.5, 1);
        }

        /* Using an IDE control comment to silence the unused selector warning */
        /* noinspection ALL */
        .navbar.scrolled {
            padding: 16px 4%;
            box-shadow: 0 10px 40px rgba(0,0,0,0.4);
            background: rgba(11, 29, 38, 0.95);
        }
        .logo {
            font-family: 'Poppins', sans-serif; font-size: 32px; font-weight: 700;
            letter-spacing: 1px; background: linear-gradient(120deg, #fff 0%, var(--accent-gold) 100%);
            -webkit-background-clip: text; -webkit-text-fill-color: transparent; text-decoration: none;
        }

        .nav-links { display: flex; align-items: center; gap: 24px; }
        .nav-links a {
            color: var(--text-pure); text-decoration: none; font-weight: 700; font-size: 13px;
            text-transform: uppercase; letter-spacing: 1px; position: relative; padding-bottom: 6px; transition: color 0.3s ease;
            white-space: nowrap;
        }
        .nav-links a::after {
            content: ''; position: absolute; bottom: 0; left: 50%; width: 0; height: 2px;
            background: linear-gradient(90deg, transparent, var(--accent-gold), transparent);
            transition: width 0.4s cubic-bezier(0.25, 1, 0.5, 1), left 0.4s cubic-bezier(0.25, 1, 0.5, 1);
        }
        .nav-links a:hover::after { width: 100%; left: 0; }
        .nav-links a:hover { color: var(--accent-gold); }
        .nav-links a.active { color: var(--accent-gold); }
        .nav-links a.active::after { width: 100%; left: 0; }

        .account-link a {
            color: var(--text-pure); text-decoration: none; font-weight: 700; font-size: 13px; text-transform: uppercase;
            letter-spacing: 1px; display: flex; align-items: center; gap: 10px; border: 1px solid rgba(255,255,255,0.15);
            padding: 10px 22px; border-radius: 30px; transition: all 0.3s ease; white-space: nowrap;
        }
        .account-link a:hover { border-color: var(--accent-gold); box-shadow: 0 0 15px var(--gold-glow); background-color: rgba(251, 215, 132, 0.05); }

        /* --- FIXED HERO OVERLAP BARRIER --- */
        .blog-hero {
            min-height: 45vh;
            width: 100%;
            display: flex; flex-direction: column; justify-content: center; align-items: center;
            text-align: center;
            padding: 130px 10% 40px 10%;
            background: radial-gradient(circle at center, rgba(15, 42, 56, 0.5) 0%, var(--bg-deep) 70%);
        }
        .blog-hero h1 {
            font-family: 'Poppins', sans-serif; font-size: clamp(34px, 4.5vw, 52px); font-weight: 700;
            margin-bottom: 20px; letter-spacing: -0.5px; line-height: 1.2;
        }
        .blog-hero p { max-width: 600px; font-size: 16px; color: var(--text-dim); line-height: 1.8; }

        /* --- CONTROLS: CATEGORIES & FILTER --- */
        .blog-controls {
            max-width: 1300px; margin: 0 auto 50px auto; padding: 0 4%;
            display: flex; justify-content: space-between; align-items: center;
            flex-wrap: wrap; gap: 20px;
        }
        .filter-tags { display: flex; gap: 12px; flex-wrap: wrap; }
        .tag-btn {
            background: var(--glass-bg); border: 1px solid var(--glass-border); color: var(--text-pure);
            padding: 10px 24px; border-radius: 25px; font-family: 'Poppins', sans-serif; font-size: 13px;
            font-weight: 600; cursor: pointer; transition: all 0.3s ease; letter-spacing: 0.5px;
        }
        .tag-btn:hover, .tag-btn.active {
            background-color: var(--accent-gold); border-color: var(--accent-gold); color: var(--bg-deep);
            box-shadow: 0 5px 20px rgba(251, 215, 132, 0.2);
        }

        /* --- FEATURED SPOTLIGHT CARD --- */
        .featured-wrapper { max-width: 1300px; margin: 0 auto 80px auto; padding: 0 4%; transition: all 0.4s ease; }
        .featured-card {
            display: flex; background: var(--glass-bg); border: 1px solid var(--glass-border);
            border-radius: 32px; overflow: hidden; min-height: 460px;
            box-shadow: 0 30px 60px rgba(0,0,0,0.2); backdrop-filter: blur(10px);
            transition: all 0.5s cubic-bezier(0.25, 1, 0.5, 1);
        }
        .featured-card:hover {
            border-color: rgba(251, 215, 132, 0.2);
            box-shadow: 0 40px 80px rgba(0,0,0,0.4);
            transform: translateY(-6px);
        }
        .featured-img { flex: 1.2; overflow: hidden; position: relative; }
        .featured-img img { width: 100%; height: 100%; object-fit: cover; transition: transform 0.7s ease; }
        .featured-card:hover .featured-img img { transform: scale(1.04); }
        .featured-content { flex: 1; padding: 60px; display: flex; flex-direction: column; justify-content: center; }

        .meta-label {
            color: var(--accent-gold); text-transform: uppercase; font-size: 12px;
            font-weight: 700; letter-spacing: 3px; margin-bottom: 20px; display: flex; align-items: center; gap: 10px;
        }
        .meta-label span { display: inline-block; width: 6px; height: 6px; background: var(--accent-gold); border-radius: 50%; }

        .featured-content h2 { font-family: 'Poppins', sans-serif; font-size: 36px; font-weight: 600; line-height: 1.3; margin-bottom: 20px; }
        .featured-content p { color: var(--text-dim); font-size: 16px; line-height: 1.8; margin-bottom: 30px; }

        .author-box { display: flex; align-items: center; gap: 15px; }
        .author-img { width: 45px; height: 45px; border-radius: 50%; overflow: hidden; border: 1px solid var(--glass-border); }
        .author-img img { width: 100%; height: 100%; object-fit: cover; }
        .author-info h4 { font-family: 'Poppins', sans-serif; font-size: 14px; font-weight: 600; }
        .author-info span { font-size: 12px; color: var(--text-dim); }

        /* --- MAIN JOURNAL GRID --- */
        .journal-container { max-width: 1300px; margin: 0 auto 120px auto; padding: 0 4%; }
        .journal-grid {
            display: grid; grid-template-columns: repeat(3, 1fr); gap: 40px 30px;
            transition: all 0.4s ease;
        }
        .post-card {
            background: var(--glass-bg); border: 1px solid var(--glass-border); border-radius: 24px;
            overflow: hidden; display: flex; flex-direction: column; height: 100%;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1); transition: all 0.5s cubic-bezier(0.25, 1, 0.5, 1);
        }
        .post-card:hover {
            border-color: rgba(251, 215, 132, 0.2);
            box-shadow: 0 35px 70px rgba(0,0,0,0.35);
            transform: translateY(-8px);
        }
        .post-thumb { width: 100%; height: 240px; overflow: hidden; }
        .post-thumb img { width: 100%; height: 100%; object-fit: cover; transition: transform 0.6s ease; }
        .post-card:hover .post-thumb img { transform: scale(1.05); }

        .post-body { padding: 35px; display: flex; flex-direction: column; flex-grow: 1; }
        .post-body h3 { font-family: 'Poppins', sans-serif; font-size: 21px; font-weight: 600; margin: 15px 0; line-height: 1.4; transition: color 0.3s; }
        .post-card:hover .post-body h3 { color: var(--accent-gold); }
        .post-body p { color: var(--text-dim); font-size: 15px; line-height: 1.7; margin-bottom: 25px; flex-grow: 1; }

        /* --- FOOTER --- */
        .main-footer { background-color: var(--footer-bg); padding: 90px 8% 45px 8%; border-top: 1px solid rgba(255, 255, 255, 0.05); }
        .footer-grid { display: flex; justify-content: space-between; align-items: flex-start; flex-wrap: wrap; gap: 50px; margin-bottom: 60px; }
        .footer-brand { flex: 1.5; min-width: 280px; }
        .footer-brand .logo { margin-bottom: 25px; display: inline-block; }
        .footer-brand p { color: var(--text-dim); line-height: 1.8; font-size: 15px; margin-bottom: 30px; max-width: 360px; }

        .footer-socials { display: flex; gap: 15px; }
        .footer-socials a {
            color: var(--text-pure); display: flex; align-items: center; justify-content: center; width: 42px; height: 42px;
            border-radius: 50%; background: rgba(255, 255, 255, 0.02); border: 1px solid rgba(255, 255, 255, 0.08); transition: all 0.3s ease;
        }
        .footer-socials a:hover { color: var(--bg-deep); background-color: var(--accent-gold); border-color: var(--accent-gold); box-shadow: 0 0 15px var(--gold-glow); transform: translateY(-4px); }

        .footer-links-col { flex: 1; min-width: 160px; }
        .footer-links-col h3 { font-family: 'Poppins', sans-serif; color: var(--accent-gold); font-size: 16px; font-weight: 600; text-transform: uppercase; letter-spacing: 2px; margin-bottom: 28px; }
        .footer-links-col ul { list-style: none; }
        .footer-links-col li { margin-bottom: 16px; }
        .footer-links-col a { color: var(--text-dim); text-decoration: none; font-size: 15px; transition: all 0.25s ease; }
        .footer-links-col a:hover { color: var(--text-pure); padding-left: 6px; }

        .footer-newsletter { flex: 1.5; min-width: 280px; }
        .footer-newsletter h3 { font-family: 'Poppins', sans-serif; color: var(--accent-gold); font-size: 16px; font-weight: 600; text-transform: uppercase; letter-spacing: 2px; margin-bottom: 28px; }
        .footer-newsletter p { color: var(--text-dim); font-size: 15px; line-height: 1.7; margin-bottom: 22px; }

        .subscribe-form { display: flex; position: relative; width: 100%; max-width: 360px; }
        .subscribe-form input { width: 100%; padding: 16px 24px; background: rgba(255, 255, 255, 0.02); border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 30px; color: var(--text-pure); outline: none; font-family: 'Lato', sans-serif; transition: border-color 0.3s; }
        .subscribe-form input:focus { border-color: var(--accent-gold); }
        .subscribe-form button { position: absolute; right: 6px; top: 6px; bottom: 6px; padding: 0 24px; background-color: var(--accent-gold); border: none; border-radius: 25px; color: var(--bg-deep); font-weight: 700; font-family: 'Poppins', sans-serif; font-size: 13px; text-transform: uppercase; letter-spacing: 0.5px; cursor: pointer; transition: all 0.3s; }
        .subscribe-form button:hover { background-color: #fff; box-shadow: 0 0 15px rgba(255,255,255,0.2); }

        .footer-bottom { padding-top: 40px; border-top: 1px solid rgba(255, 255, 255, 0.04); display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 20px; }
        .footer-bottom p { color: rgba(255, 255, 255, 0.3); font-size: 13px; }
        .footer-privacy-links { display: flex; gap: 25px; }
        .footer-privacy-links a { color: rgba(255, 255, 255, 0.3); text-decoration: none; font-size: 13px; transition: color 0.2s; }
        .footer-privacy-links a:hover { color: var(--text-pure); }

        /* --- RESPONSIVE BREAKPOINTS --- */
        @media (max-width: 1200px) {
            .nav-links { gap: 14px; }
            .nav-links a { font-size: 12px; }
            .journal-grid { grid-template-columns: repeat(2, 1fr); }
        }
        @media (max-width: 950px) {
            .navbar { padding: 20px 4%; }
            .nav-links { display: none; }
            .blog-hero { padding-top: 120px; }
            .featured-card { flex-direction: column; }
            .featured-content { padding: 40px; }
            .footer-grid { flex-direction: column; gap: 40px; }
        }
        @media (max-width: 650px) {
            .journal-grid { grid-template-columns: 1fr; }
            .blog-controls { flex-direction: column; align-items: flex-start; }
        }
    </style>
</head>
<body>

<nav class="navbar" id="stickyNavbar">
    <a href="${pageContext.request.contextPath}/" class="logo">GoTrek</a>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/">Home</a>
        <a href="${pageContext.request.contextPath}/about">About Us</a>
        <a href="${pageContext.request.contextPath}/tourpackage">Tour Packages</a>
        <a href="${pageContext.request.contextPath}/info">Tourist Info</a>
        <a href="${pageContext.request.contextPath}/blog" class="active">Blogs</a>
        <a href="gallery">Gallery</a>
        <a href="contact">Contact Us</a>
    </div>
    <div class="account-link">
        <a href="#">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
            Account
        </a>
    </div>
</nav>

<header class="blog-hero">
    <p style="color: var(--accent-gold); text-transform: uppercase; letter-spacing: 6px; font-weight: 700; margin-bottom: 15px; font-size: 12px;">The GoTrek Dispatch</p>
    <h1>Stories From The Edge</h1>
    <p>In-depth technical equipment breakdowns, tactical routing strategies, and field diaries straight from our expedition guides.</p>
</header>

<div class="blog-controls">
    <div class="filter-tags">
        <button class="tag-btn active" data-filter="all">All Logbooks</button>
        <button class="tag-btn" data-filter="routes">Alpine Routes</button>
        <button class="tag-btn" data-filter="gear">Gear Science</button>
        <button class="tag-btn" data-filter="reports">Field Reports</button>
    </div>
</div>

<section class="featured-wrapper global-filter-item" data-category="gear">
    <div class="featured-card">
        <div class="featured-img">
            <img src="https://images.unsplash.com/photo-1519681393784-d120267933ba?auto=format&fit=crop&w=1200&q=80" alt="Stunning high altitude mountain ridge">
        </div>
        <div class="featured-content">
            <div class="meta-label">
                <span></span> Featured Entry &bull; Gear Guide
            </div>
            <h2>Surviving the Void: The Anatomy of a High-Altitude Sleep Grid</h2>
            <p>An exhaustive, field-tested technical study on thermal retention configurations required to sustain metabolic recovery profiles when camp elevation crosses 5,000 meters.</p>
            <div class="author-box">
                <div class="author-img">
                    <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=150&q=80" alt="Elena Rostova">
                </div>
                <div class="author-info">
                    <h4>Elena Rostova</h4>
                    <span>Lead Field Tactician &bull; June 2026</span>
                </div>
            </div>
        </div>
    </div>
</section>

<main class="journal-container">
    <div class="journal-grid">

        <article class="post-card global-filter-item" data-category="routes">
            <div class="post-thumb">
                <img src="https://images.unsplash.com/photo-1475274047050-1d0c0975c63e?auto=format&fit=crop&w=600&q=80" alt="Mountain sky at dusk">
            </div>
            <div class="post-body">
                <div class="meta-label"><span></span> Alpine Routes</div>
                <h3>The Patagonia Crossings: Navigating Winds of the Fitz Roy</h3>
                <p>Analyzing cross-current patterns and baseline tracking protocols along the technical corridors of Southern Patagonia.</p>
                <div class="author-box">
                    <div class="author-img">
                        <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=150&q=80" alt="Marcus Vance">
                    </div>
                    <div class="author-info">
                        <h4>Marcus Vance</h4>
                        <span>Field Guide &bull; 4 Min Read</span>
                    </div>
                </div>
            </div>
        </article>

        <article class="post-card global-filter-item" data-category="gear">
            <div class="post-thumb">
                <img src="https://images.unsplash.com/photo-1461696114087-397271a7aedc?auto=format&fit=crop&w=600&q=80" alt="Climber gear configuration">
            </div>
            <div class="post-body">
                <div class="meta-label"><span></span> Gear Science</div>
                <h3>Rigid Crampons vs. Flexible Attachments</h3>
                <p>A data-backed review outlining traction efficiency thresholds across mixed technical vertical layouts.</p>
                <div class="author-box">
                    <div class="author-img">
                        <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=150&q=80" alt="Elena Rostova">
                    </div>
                    <div class="author-info">
                        <h4>Elena Rostova</h4>
                        <span>Lead Tactician &bull; 7 Min Read</span>
                    </div>
                </div>
            </div>
        </article>

        <article class="post-card global-filter-item" data-category="reports">
            <div class="post-thumb">
                <img src="https://images.unsplash.com/photo-1483728642387-6c3bdd6c93e5?auto=format&fit=crop&w=600&q=80" alt="Panoramic snow mountains">
            </div>
            <div class="post-body">
                <div class="meta-label"><span></span> Field Reports</div>
                <h3>Himalayan Oxygen Saturation Matrix Analysis</h3>
                <p>Direct tracking log reviews examining acclimatization response arrays across our active spring routes.</p>
                <div class="author-box">
                    <div class="author-img">
                        <img src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=150&q=80" alt="Dr. Aris Thorne">
                    </div>
                    <div class="author-info">
                        <h4>Dr. Aris Thorne</h4>
                        <span>Medical Officer &bull; 9 Min Read</span>
                    </div>
                </div>
            </div>
        </article>

    </div>
</main>

<footer class="main-footer">
    <div class="footer-grid">
        <div class="footer-brand">
            <a href="#" class="logo">GoTrek</a>
            <p>Get out into nature with premium gear configurations, elite routes, and continuous telemetry from certified field experts.</p>
            <div class="footer-socials">
                <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                <a href="#"><i class="fa-brands fa-instagram"></i></a>
                <a href="#"><i class="fa-brands fa-x-twitter"></i></a>
            </div>
        </div>
        <div class="footer-links-col">
            <h3>Navigation</h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/">Home Base</a></li>
                <li><a href="${pageContext.request.contextPath}/about">About Team</a></li>
                <li><a href="${pageContext.request.contextPath}/tourpackage">Expeditions</a></li>
            </ul>
        </div>
        <div class="footer-newsletter">
            <h3>The Field Ledger</h3>
            <p>Subscribe to receive high-altitude routing briefs, technical equipment assessments, and entry updates.</p>
            <form class="subscribe-form" onsubmit="event.preventDefault();">
                <input type="email" placeholder="Corporate email address" aria-label="Corporate email address" required>
                <button type="submit">Join</button>
            </form>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2026 GoTrek Adventure Corp. Designed for the wild.</p>
        <div class="footer-privacy-links">
            <a href="#">Terms of Duty</a>
            <a href="#">Privacy Baseline</a>
        </div>
    </div>
</footer>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        // --- STICKY NAVBAR ENGINE ---
        window.addEventListener('scroll', function() {
            const navbar = document.getElementById("stickyNavbar");
            if (navbar) {
                if (window.scrollY > 40) {
                    navbar.classList.add("scrolled");
                } else {
                    navbar.classList.remove("scrolled");
                }
            }
        });

        // --- LIVE BLOG SORT FILTER ENGINE ---
        const filterButtons = document.querySelectorAll(".tag-btn");
        const itemsToFilter = document.querySelectorAll(".global-filter-item");

        filterButtons.forEach(button => {
            button.addEventListener("click", () => {
                // Swap active button selection state cleanly
                document.querySelector(".tag-btn.active").classList.remove("active");
                button.classList.add("active");

                const targetFilter = button.getAttribute("data-filter");

                itemsToFilter.forEach(item => {
                    const itemCategory = item.getAttribute("data-category");

                    if (targetFilter === "all" || itemCategory === targetFilter) {
                        item.style.display = ""; // Returns display back to grid/flex naturally
                        setTimeout(() => {
                            item.style.opacity = "1";
                            item.style.transform = "scale(1)";
                        }, 10);
                    } else {
                        item.style.opacity = "0";
                        item.style.transform = "scale(0.98)";
                        item.style.display = "none";
                    }
                });
            });
        });
    });
</script>

</body>
</html>