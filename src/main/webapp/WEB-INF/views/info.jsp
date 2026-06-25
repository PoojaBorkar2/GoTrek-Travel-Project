<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tourist Info | GoTrek Expedition Intelligence</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&family=Lato:wght@400;700&display=swap" rel="stylesheet">
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

        /* --- CORE RESET & SMOOTH SCROLL --- */
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
            letter-spacing: 0.3px;
        }

        /* --- OPTIMIZED STICKY NAVIGATION (FIXED SPACING FOR ALL LINKS) --- */
        .navbar {
            position: fixed; top: 0; left: 0; width: 100%;
            display: flex; justify-content: space-between; align-items: center;
            padding: 30px 4%; z-index: 1000;
            background: rgba(11, 29, 38, 0.9);
            backdrop-filter: blur(20px); -webkit-backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.04);
            transition: all 0.5s cubic-bezier(0.25, 1, 0.5, 1);
        }
        .navbar.scrolled { padding: 16px 4%; box-shadow: 0 10px 40px rgba(0,0,0,0.4); }

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

        .account-link a {
            color: var(--text-pure); text-decoration: none; font-weight: 700; font-size: 13px; text-transform: uppercase;
            letter-spacing: 1px; display: flex; align-items: center; gap: 10px; border: 1px solid rgba(255,255,255,0.15);
            padding: 10px 22px; border-radius: 30px; transition: all 0.3s ease; white-space: nowrap;
        }
        .account-link a:hover { border-color: var(--accent-gold); box-shadow: 0 0 15px var(--gold-glow); background-color: rgba(251, 215, 132, 0.05); }

        /* --- HERO: REBALANCED & FINELY PROPORTIONED TYPOGRAPHY --- */
        .hero-section {
            height: 75vh; width: 100%;
            background: linear-gradient(rgba(11, 29, 38, 0.65), var(--bg-deep)),
            url('https://images.unsplash.com/photo-1486915309851-b0cc1f8a0084?auto=format&fit=crop&w=1800&q=80');
            background-size: cover; background-position: center;
            display: flex; flex-direction: column; justify-content: center; align-items: center;
            text-align: center; padding: 80px 10% 0 10%;
        }
        .hero-section h1 {
            font-family: 'Poppins', sans-serif;
            font-size: clamp(38px, 4.5vw, 54px); /* Scales cleanly down on laptops and tablets */
            font-weight: 700;
            margin-bottom: 24px;
            line-height: 1.2;
            letter-spacing: -0.5px;
            text-shadow: 0 4px 20px rgba(0, 0, 0, 0.6); /* Guarantees clean contrast on photographic highlights */
        }
        .hero-section p {
            max-width: 700px; font-size: 16px; color: var(--text-dim); letter-spacing: 0.5px; line-height: 1.8;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.4);
        }

        /* --- BENTO GRID: INTELLIGENCE MODULES --- */
        .intelligence-container {
            padding: 80px 6% 120px 6%;
            max-width: 1400px; margin: 0 auto;
        }

        .bento-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            grid-template-rows: repeat(2, 320px);
            gap: 30px;
        }

        .bento-card {
            background: var(--glass-bg);
            border: 1px solid var(--glass-border);
            border-radius: 24px;
            padding: 40px;
            position: relative;
            overflow: hidden;
            box-shadow: 0 30px 60px rgba(0,0,0,0.15);
            backdrop-filter: blur(8px); -webkit-backdrop-filter: blur(8px);
            transition: all 0.5s cubic-bezier(0.25, 1, 0.5, 1);
        }
        .bento-card:hover {
            border-color: rgba(251, 215, 132, 0.25);
            box-shadow: 0 40px 80px rgba(0,0,0,0.4), 0 0 30px rgba(251, 215, 132, 0.05);
            transform: translateY(-8px);
        }

        .card-large { grid-column: span 2; grid-row: span 2; display: flex; flex-direction: column; justify-content: flex-end; }
        .card-wide { grid-column: span 2; }

        /* Gear Module */
        .gear-module {
            background-image: linear-gradient(to top, #0B1D26 15%, rgba(11, 29, 38, 0.3) 70%, transparent 100%),
            url('https://images.unsplash.com/photo-1526772662000-3f88f10405ff?auto=format&fit=crop&w=800&q=80');
            background-size: cover; background-position: center;
        }

        /* Visa Context Card */
        .visa-module {
            background-image: linear-gradient(45deg, rgba(11,29,38,0.95) 40%, rgba(11,29,38,0.5)),
            url('https://images.unsplash.com/photo-1488646953014-85cb44e25828?auto=format&fit=crop&w=800&q=80');
            background-size: cover; background-position: center;
        }

        .bento-card h2 { font-family: 'Poppins', sans-serif; font-size: 26px; margin-bottom: 12px; color: var(--accent-gold); font-weight: 600; }
        .bento-card p { color: var(--text-dim); font-size: 14.5px; line-height: 1.6; }

        .check-list { list-style: none; margin-top: 20px; }
        .check-list li { margin-bottom: 12px; display: flex; align-items: center; gap: 12px; font-size: 14px; color: var(--text-pure); }
        .check-list i { color: var(--accent-gold); font-size: 10px; }

        /* --- SECTION: OPERATIONAL SAFETY --- */
        .safety-spotlight {
            padding: 120px 6%;
            display: flex; gap: 80px; align-items: center;
            background: rgba(255,255,255,0.01);
            border-top: 1px solid rgba(255,255,255,0.03);
            border-bottom: 1px solid rgba(255,255,255,0.03);
            margin: 40px 0;
        }
        .safety-image {
            flex: 1; height: 520px; border-radius: 24px; overflow: hidden;
            border: 1px solid var(--glass-border); box-shadow: 0 30px 60px rgba(0,0,0,0.3);
        }
        .safety-image img { width: 100%; height: 100%; object-fit: cover; }
        .safety-text { flex: 1; }
        .safety-text h3 { font-family: 'Poppins', sans-serif; font-size: 42px; margin-bottom: 25px; font-weight: 600; line-height: 1.3; }
        .safety-text p { color: var(--text-dim); font-size: 16px; margin-bottom: 30px; line-height: 1.8; }

        /* --- INTERACTIVE FAQ --- */
        .faq-wrapper { max-width: 900px; margin: 120px auto 40px auto; padding: 0 20px; }
        .faq-wrapper h2 { font-family: 'Poppins', sans-serif; font-size: 40px; text-align: center; margin-bottom: 50px; font-weight: 600; }

        .faq-item {
            background: rgba(255,255,255,0.02);
            border: 1px solid var(--glass-border);
            border-radius: 16px; margin-bottom: 18px; overflow: hidden;
            transition: all 0.3s cubic-bezier(0.25, 1, 0.5, 1);
        }
        .faq-question {
            padding: 26px 35px; display: flex; justify-content: space-between; align-items: center;
            font-weight: 700; font-size: 16px; cursor: pointer; letter-spacing: 0.5px;
        }
        .faq-question:hover { color: var(--accent-gold); }
        .faq-answer {
            max-height: 0; padding: 0 35px; overflow: hidden;
            color: var(--text-dim); font-size: 15px; line-height: 1.7; transition: all 0.4s cubic-bezier(0, 1, 0, 1);
        }
        .faq-item.active { border-color: rgba(251, 215, 132, 0.3); background: rgba(251, 215, 132, 0.02); box-shadow: 0 15px 30px rgba(0,0,0,0.2); }
        .faq-item.active .faq-answer { max-height: 300px; padding-bottom: 26px; }
        .faq-icon { color: var(--accent-gold); font-size: 18px; transition: transform 0.3s ease; }
        .faq-item.active .faq-icon { transform: rotate(45deg); }

        /* --- LUXURIOUS FOOTER --- */
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
        .footer-links-col a { color: var(--text-dim); text-decoration: none; font-size: 14.5px; transition: all 0.25s ease; }
        .footer-links-col a:hover { color: var(--text-pure); padding-left: 6px; }

        .footer-newsletter { flex: 1.5; min-width: 280px; }
        .footer-newsletter h3 { font-family: 'Poppins', sans-serif; color: var(--accent-gold); font-size: 16px; font-weight: 600; text-transform: uppercase; letter-spacing: 2px; margin-bottom: 28px; }
        .footer-newsletter p { color: var(--text-dim); font-size: 14.5px; line-height: 1.7; margin-bottom: 22px; }

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

        /* --- RESPONSIVE ADAPTATION --- */
        @media (max-width: 1200px) {
            .nav-links { gap: 14px; }
            .nav-links a { font-size: 12px; }
        }
        @media (max-width: 1100px) {
            .bento-grid { grid-template-columns: repeat(2, 1fr); grid-template-rows: auto; }
            .card-large { grid-column: span 2; grid-row: span 1; height: 380px; }
            .safety-spotlight { flex-direction: column; text-align: center; gap: 40px; }
            .safety-image { width: 100%; height: 380px; }
        }
        @media (max-width: 950px) {
            .navbar { padding: 25px 4%; }
            .nav-links { display: none; }
            .footer-grid { flex-direction: column; gap: 40px; }
            .footer-bottom { flex-direction: column; text-align: center; }
        }
        @media (max-width: 600px) {
            .bento-grid { grid-template-columns: 1fr; }
            .card-large, .card-wide { grid-column: span 1; height: 340px; }
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
        <a href="blog">Blogs</a>
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

<header class="hero-section">
    <p style="color: var(--accent-gold); text-transform: uppercase; letter-spacing: 6px; font-weight: 700; margin-bottom: 15px; font-size: 13px;">Preparation Baseline</p>
    <h1>Expedition Logistics & Intelligence</h1>
    <p>Operational directives and cross-border protocols for our 2026 signature circuits.</p>
</header>

<main class="intelligence-container">
    <div class="bento-grid">
        <div class="bento-card card-large gear-module">
            <h2>The Technical Gear Kit</h2>
            <p>Standardized equipment requirements for high-altitude endurance and weather resilience.</p>
            <ul class="check-list">
                <li><i class="fa-solid fa-circle"></i> Grade-B Rigid Crampon-ready Boots</li>
                <li><i class="fa-solid fa-circle"></i> 4-Season Rated Sleeping Systems (-15°C)</li>
                <li><i class="fa-solid fa-circle"></i> GPS Integrated Beacon & Personal Locators</li>
            </ul>
        </div>

        <div class="bento-card card-wide visa-module">
            <h2>Visa & Global Entry</h2>
            <p>Coordinating transit logistics across South America, Rajasthan, and the Himalayas.</p>
            <ul class="check-list">
                <li><i class="fa-solid fa-plane-arrival"></i> Nepal: 30/90 Day Visa-on-Arrival Processing</li>
                <li><i class="fa-solid fa-plane-arrival"></i> India: Mandatory e-Tourist Visa (30 Days)</li>
            </ul>
        </div>

        <div class="bento-card">
            <i class="fa-solid fa-heart-pulse" style="color: var(--accent-gold); font-size: 32px; margin-bottom: 15px;"></i>
            <h2>Health Baseline</h2>
            <p>Mandatory acclimatization stops built into every high-altitude route path.</p>
        </div>

        <div class="bento-card">
            <i class="fa-solid fa-shield-halved" style="color: var(--accent-gold); font-size: 32px; margin-bottom: 15px;"></i>
            <h2>Safety Cover</h2>
            <p>Specialized alpine rescue and evacuation insurance is required globally.</p>
        </div>
    </div>

    <section class="safety-spotlight">
        <div class="safety-image">
            <img src="https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?auto=format&fit=crop&w=1000&q=80" alt="Mountain Safety Peaks">
        </div>
        <div class="safety-text">
            <p style="color: var(--accent-gold); text-transform: uppercase; letter-spacing: 3px; font-weight: 700; margin-bottom: 10px; font-size: 12px;">The Safety Margin</p>
            <h3>Zero-Footprint Safety Protocols</h3>
            <p>Our safety teams are comprised of IFMGA-certified guides who enforce strict "No-Trace" environmental ethics and oxygen-saturation monitoring at every camp point.</p>
            <ul class="check-list">
                <li><i class="fa-solid fa-circle-check"></i> 24/7 Satellite Link to Medical Dispatch</li>
                <li><i class="fa-solid fa-circle-check"></i> Secondary Oxygen Supply at High Camps</li>
                <li><i class="fa-solid fa-circle-check"></i> Professional Terrain Risk Mapping</li>
            </ul>
        </div>
    </section>

    <div class="faq-wrapper">
        <h2>Expedition FAQ</h2>
        <div class="faq-item" onclick="this.classList.toggle('active')">
            <div class="faq-question">
                <span>How do we handle Acute Mountain Sickness (AMS)?</span>
                <span class="faq-icon">+</span>
            </div>
            <div class="faq-answer">
                We utilize a "Climb High, Sleep Low" methodology. Every itinerary includes scheduled rest days and slow elevation gains (avg. 300m/day) to ensure natural physiological adaptation.
            </div>
        </div>

        <div class="faq-item" onclick="this.classList.toggle('active')">
            <div class="faq-question">
                <span>Is personal training required before booking?</span>
                <span class="faq-icon">+</span>
            </div>
            <div class="faq-answer">
                For our Moderate and Expert tracks, we recommend a 12-week focused cardiovascular regimen. We provide a tailored training blueprint upon deposit confirmation.
            </div>
        </div>

        <div class="faq-item" onclick="this.classList.toggle('active')">
            <div class="faq-question">
                <span>What food logistics are deployed in the field?</span>
                <span class="faq-icon">+</span>
            </div>
            <div class="faq-answer">
                Our kitchen crews serve fresh, high-protein, carbohydrate-dense meals. We cater to all dietary matrices including vegan, gluten-free, and high-energy metabolic needs.
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
                <input type="email" placeholder="Corporate email address" required>
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
    window.onscroll = function() {
        var navbar = document.getElementById("stickyNavbar");
        if (window.scrollY > 40) {
            navbar.classList.add("scrolled");
        } else {
            navbar.classList.remove("scrolled");
        }
    };
</script>

</body>
</html>