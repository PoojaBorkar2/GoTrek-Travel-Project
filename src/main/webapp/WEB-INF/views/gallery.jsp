<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Telemetry Gallery | GoTrek</title>

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

        /* noinspection ALL */
        .navbar.scrolled {
            padding: 16px 4%;
            box-shadow: 0 10px 40px rgba(0,0,0,0.4);
            background: rgba(11, 29, 38, 0.95);
        }

        .logo {
            font-family: 'Poppins', sans-serif; font-size: 32px; font-weight: 700;
            letter-spacing: 1.5px; background: linear-gradient(120deg, #fff 0%, var(--accent-gold) 100%);
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

        /* --- HERO OVERLAP BARRIER --- */
        .gallery-hero {
            min-height: 40vh;
            width: 100%;
            display: flex; flex-direction: column; justify-content: center; align-items: center;
            text-align: center;
            padding: 140px 10% 20px 10%;
            background: radial-gradient(circle at center, rgba(15, 42, 56, 0.5) 0%, var(--bg-deep) 70%);
        }
        .gallery-hero h1 {
            font-family: 'Poppins', sans-serif; font-size: clamp(34px, 4.5vw, 52px); font-weight: 700;
            margin-bottom: 20px; letter-spacing: -0.5px; line-height: 1.2;
        }
        .gallery-hero p { max-width: 600px; font-size: 16px; color: var(--text-dim); line-height: 1.8; }

        /* --- FILTERS --- */
        .gallery-controls {
            max-width: 1300px; margin: 0 auto 40px auto; padding: 0 4%;
            display: flex; justify-content: center; align-items: center;
        }
        .filter-tags { display: flex; gap: 12px; flex-wrap: wrap; justify-content: center; }
        .tag-btn {
            background: var(--glass-bg); border: 1px solid var(--glass-border); color: var(--text-pure);
            padding: 10px 24px; border-radius: 25px; font-family: 'Poppins', sans-serif; font-size: 13px;
            font-weight: 600; cursor: pointer; transition: all 0.3s ease; letter-spacing: 0.5px;
        }
        .tag-btn:hover, .tag-btn.active {
            background-color: var(--accent-gold); border-color: var(--accent-gold); color: var(--bg-deep);
            box-shadow: 0 5px 20px rgba(251, 215, 132, 0.2);
        }

        /* --- GALLERY GRID MATRIX --- */
        .gallery-container { max-width: 1300px; margin: 0 auto 100px auto; padding: 0 4%; }
        .gallery-grid {
            display: grid; grid-template-columns: repeat(3, 1fr); gap: 30px;
        }

        .gallery-item {
            position: relative; border-radius: 20px; overflow: hidden;
            background: var(--glass-bg); border: 1px solid var(--glass-border);
            aspect-ratio: 4 / 3; box-shadow: 0 15px 35px rgba(0,0,0,0.2);
            transition: all 0.5s cubic-bezier(0.25, 1, 0.5, 1);
        }
        .gallery-item img {
            width: 100%; height: 100%; object-fit: cover;
            transition: transform 0.8s cubic-bezier(0.25, 1, 0.5, 1);
        }

        /* HOVER INTERACTIONS */
        .gallery-item:hover {
            transform: translateY(-5px);
            border-color: rgba(251, 215, 132, 0.3);
            box-shadow: 0 25px 50px rgba(0,0,0,0.4);
        }
        .gallery-item:hover img { transform: scale(1.06); }

        /* CAPTION OVERLAY GLASS CARD */
        .gallery-overlay {
            position: absolute; bottom: 0; left: 0; width: 100%;
            padding: 25px; background: linear-gradient(360deg, rgba(6,18,24,0.9) 0%, rgba(6,18,24,0.4) 70%, transparent 100%);
            backdrop-filter: blur(4px); -webkit-backdrop-filter: blur(4px);
            display: flex; flex-direction: column; justify-content: flex-end;
            opacity: 0; transform: translateY(10px); transition: all 0.4s ease;
        }
        .gallery-item:hover .gallery-overlay {
            opacity: 1; transform: translateY(0);
        }

        .gallery-overlay span {
            color: var(--accent-gold); font-size: 11px; text-transform: uppercase;
            font-weight: 700; letter-spacing: 2px; margin-bottom: 5px;
        }
        .gallery-overlay h3 {
            font-family: 'Poppins', sans-serif; font-size: 18px; font-weight: 600;
            color: var(--text-pure);
        }

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
        @media (max-width: 1100px) {
            .gallery-grid { grid-template-columns: repeat(2, 1fr); }
        }
        @media (max-width: 950px) {
            .navbar { padding: 20px 4%; }
            .nav-links { display: none; }
            .gallery-hero { padding-top: 120px; }
            .footer-grid { flex-direction: column; gap: 40px; }
        }
        @media (max-width: 650px) {
            .gallery-grid { grid-template-columns: 1fr; }
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
        <a href="${pageContext.request.contextPath}/blog">Blogs</a>
        <a href="${pageContext.request.contextPath}/gallery" class="active">Gallery</a>
        <a href="contact">Contact Us</a>
    </div>
    <div class="account-link">
        <a href="#">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
            Account
        </a>
    </div>
</nav>

<header class="gallery-hero">
    <p style="color: var(--accent-gold); text-transform: uppercase; letter-spacing: 6px; font-weight: 700; margin-bottom: 15px; font-size: 12px;">Visual Matrix</p>
    <h1>The Field Capture Stream</h1>
    <p>Real-time high altitude captures, route layouts, and basecamp configurations directly from active monitoring channels.</p>
</header>

<div class="gallery-controls">
    <div class="filter-tags">
        <button class="tag-btn active" data-filter="all">All Telemetry</button>
        <button class="tag-btn" data-filter="peaks">Alpine Peaks</button>
        <button class="tag-btn" data-filter="basecamps">Basecamps</button>
        <button class="tag-btn" data-filter="gear">Expedition Gear</button>
    </div>
</div>

<main class="gallery-container">
    <div class="gallery-grid">

        <div class="gallery-item" data-category="peaks">
            <img src="https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?auto=format&fit=crop&w=700&q=80" alt="Mountain summit ridge lines">
            <div class="gallery-overlay">
                <span>Alpine Peaks</span>
                <h3>Fitz Roy Summit Ridge</h3>
            </div>
        </div>

        <div class="gallery-item" data-category="basecamps">
            <img src="https://images.unsplash.com/photo-1504280390367-361c6d9f38f4?auto=format&fit=crop&w=700&q=80" alt="Night camp under stars">
            <div class="gallery-overlay">
                <span>Basecamps</span>
                <h3>Sector 4 Thermal Pod Array</h3>
            </div>
        </div>

        <div class="gallery-item" data-category="gear">
            <img src="https://images.unsplash.com/photo-1526772662000-3f88f10405ff?auto=format&fit=crop&w=700&q=80" alt="Climber packing tech gear">
            <div class="gallery-overlay">
                <span>Expedition Gear</span>
                <h3>Loadout Matrix Testing</h3>
            </div>
        </div>

        <div class="gallery-item" data-category="peaks">
            <img src="https://images.unsplash.com/photo-1486915309851-b0cc1f8a0084?auto=format&fit=crop&w=700&q=80" alt="Climber on vertical wall">
            <div class="gallery-overlay">
                <span>Alpine Peaks</span>
                <h3>Vertical Wall Transit</h3>
            </div>
        </div>

        <div class="gallery-item" data-category="basecamps">
            <img src="https://images.unsplash.com/photo-1533240332313-0db49b459ad6?auto=format&fit=crop&w=700&q=80" alt="Snow basecamp tents">
            <div class="gallery-overlay">
                <span>Basecamps</span>
                <h3>Khumbu Ascent Staging</h3>
            </div>
        </div>

        <div class="gallery-item" data-category="gear">
            <img src="https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?auto=format&fit=crop&w=700&q=80" alt="Mountain stream trail">
            <div class="gallery-overlay">
                <span>Expedition Gear</span>
                <h3>Low Altitude Recon Trace</h3>
            </div>
        </div>

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

    // --- LIVE FILTER MATRIX ENGINE ---
    document.addEventListener("DOMContentLoaded", function() {
        const filterButtons = document.querySelectorAll(".tag-btn");
        const galleryItems = document.querySelectorAll(".gallery-item");

        filterButtons.forEach(button => {
            button.addEventListener("click", () => {
                // Remove active highlight style from previous button, apply to clicked button
                document.querySelector(".tag-btn.active").classList.remove("active");
                button.classList.add("active");

                const targetFilter = button.getAttribute("data-filter");

                galleryItems.forEach(item => {
                    const itemCategory = item.getAttribute("data-category");

                    if (targetFilter === "all" || itemCategory === targetFilter) {
                        // Show item cleanly
                        item.style.display = "block";
                        setTimeout(() => { item.style.opacity = "1"; item.style.transform = "scale(1)"; }, 10);
                    } else {
                        // Hide item cleanly
                        item.style.opacity = "0";
                        item.style.transform = "scale(0.95)";
                        item.style.display = "none";
                    }
                });
            });
        });
    });
</script>

</body>
</html>