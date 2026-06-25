<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About GoTrek | Our Story and Mission</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,600;0,700;1,400&family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        /* --- PREMIUM CONFIG VARIABLES --- */
        :root {
            --bg-color: #0B1D26;
            --bg-gradient: linear-gradient(180deg, #0B1D26 0%, #0F2A38 50%, #0B1D26 100%);
            --accent-color: #FBD784;
            --accent-glow: rgba(251, 215, 132, 0.4);
            --text-white: #FFFFFF;
            --text-muted: rgba(255, 255, 255, 0.65);
            --card-bg: rgba(255, 255, 255, 0.02);
            --card-border: rgba(255, 255, 255, 0.05);
            --info-box-bg: rgba(251, 215, 132, 0.03);
            --info-box-border: rgba(251, 215, 132, 0.15);
            --footer-bg: #061218;
        }

        /* --- STYLISH SELECTION & SCROLLBAR --- */
        ::-webkit-scrollbar {
            width: 8px;
        }
        ::-webkit-scrollbar-track {
            background: var(--bg-color);
        }
        ::-webkit-scrollbar-thumb {
            background: rgba(251, 215, 132, 0.3);
            border-radius: 4px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: var(--accent-color);
        }

        /* --- GLOBAL RESET --- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: var(--bg-gradient);
            color: var(--text-white);
            font-family: 'Open Sans', sans-serif;
            overflow-x: hidden;
            letter-spacing: 0.3px;
        }

        /* --- ARRANGED NAVBAR LAYOUT --- */
        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 35px 5%;
            z-index: 1000;
            background-color: rgba(11, 29, 38, 0.85); /* Slightly solid initially for subpages */
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.04);
            transition: all 0.5s cubic-bezier(0.25, 1, 0.5, 1);
        }

        .navbar.scrolled {
            padding: 18px 5%;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.4);
        }

        .nav-logo-container {
            flex: 0 0 auto;
        }

        .logo {
            font-family: 'Playfair Display', serif;
            font-size: 34px;
            font-weight: 700;
            letter-spacing: 1.5px;
            background: linear-gradient(120deg, #fff 0%, var(--accent-color) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            transition: transform 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .nav-links {
            display: flex;
            align-items: center;
            justify-content: center;
            flex: 1 1 auto;
            gap: 28px;
            padding: 0 20px;
        }

        .nav-links a {
            color: var(--text-white);
            text-decoration: none;
            font-weight: 700;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            padding-bottom: 6px;
            transition: color 0.3s ease;
            white-space: nowrap;
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            width: 0;
            height: 2px;
            background: linear-gradient(90deg, transparent, var(--accent-color), transparent);
            transition: width 0.4s cubic-bezier(0.25, 1, 0.5, 1), left 0.4s cubic-bezier(0.25, 1, 0.5, 1);
        }

        .nav-links a:hover::after {
            width: 100%;
            left: 0;
        }

        .nav-links a:hover, .account-link a:hover {
            color: var(--accent-color);
        }

        .account-link {
            flex: 0 0 auto;
            display: flex;
            justify-content: flex-end;
        }

        .account-link a {
            color: var(--text-white);
            text-decoration: none;
            font-weight: 700;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 1px;
            display: flex;
            align-items: center;
            gap: 10px;
            border: 1px solid rgba(255,255,255,0.15);
            padding: 10px 22px;
            border-radius: 30px;
            transition: all 0.3s ease;
            white-space: nowrap;
        }

        .account-link a:hover {
            border-color: var(--accent-color);
            box-shadow: 0 0 15px var(--accent-glow);
            background-color: rgba(251, 215, 132, 0.05);
        }

        /* --- CINEMATIC ABOUT HEADER --- */
        .about-header {
            padding: 200px 8% 100px 8%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 5%;
            min-height: 80vh;
        }

        .header-text {
            flex: 1.2;
        }

        .header-text h1 {
            font-family: 'Playfair Display', serif;
            font-size: 64px;
            line-height: 1.15;
            margin-bottom: 30px;
        }

        .header-text p {
            color: var(--text-muted);
            font-size: 18px;
            line-height: 1.8;
            margin-bottom: 20px;
        }

        .header-visual {
            flex: 0.8;
            height: 450px;
            background-image: linear-gradient(35deg, rgba(11,29,38,0.6), transparent), url('https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?auto=format&fit=crop&w=800&q=80');
            background-size: cover;
            background-position: center;
            border-radius: 16px;
            box-shadow: 0 30px 60px rgba(0,0,0,0.4);
            border: 1px solid var(--card-border);
        }

        /* --- VALUES SECTION --- */
        .values-section {
            padding: 100px 8%;
            text-align: center;
        }

        .section-headline {
            font-family: 'Playfair Display', serif;
            font-size: 42px;
            margin-bottom: 60px;
        }

        .values-grid {
            display: flex;
            gap: 30px;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .value-card {
            flex: 1;
            min-width: 280px;
            background: var(--card-bg);
            border: 1px solid var(--card-border);
            padding: 40px 30px;
            border-radius: 16px;
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            transition: all 0.4s ease;
            text-align: left;
        }

        .value-card:hover {
            transform: translateY(-8px);
            border-color: rgba(251, 215, 132, 0.2);
            box-shadow: 0 20px 40px rgba(0,0,0,0.3);
        }

        .value-icon {
            color: var(--accent-color);
            margin-bottom: 25px;
            display: inline-block;
        }

        .value-card h3 {
            font-family: 'Playfair Display', serif;
            font-size: 24px;
            margin-bottom: 15px;
            font-weight: 600;
        }

        .value-card p {
            color: var(--text-muted);
            font-size: 15px;
            line-height: 1.7;
        }

        /* --- THE TEAM SECTION --- */
        .team-section {
            padding: 100px 8% 160px 8%;
        }

        .team-grid {
            display: flex;
            gap: 40px;
            justify-content: center;
            flex-wrap: wrap;
            margin-top: 60px;
        }

        .team-card {
            width: 300px;
            background: var(--card-bg);
            border: 1px solid var(--card-border);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 20px 40px rgba(0,0,0,0.2);
            transition: transform 0.4s ease;
        }

        .team-card:hover {
            transform: scale(1.02);
        }

        .team-img {
            height: 320px;
            background-size: cover;
            background-position: center;
            position: relative;
        }

        .member-1 { background-image: url('https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=500&q=80'); }
        .member-2 { background-image: url('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=500&q=80'); }
        .member-3 { background-image: url('https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=500&q=80'); }

        .team-info {
            padding: 25px;
            text-align: center;
        }

        .team-info h4 {
            font-family: 'Playfair Display', serif;
            font-size: 22px;
            margin-bottom: 6px;
        }

        .team-info span {
            color: var(--accent-color);
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: 700;
        }

        /* --- PREMIUM FOOTER STYLE --- */
        .main-footer {
            background-color: var(--footer-bg);
            padding: 80px 8% 40px 8%;
            border-top: 1px solid rgba(255, 255, 255, 0.05);
            position: relative;
            z-index: 5;
        }

        .footer-grid {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            flex-wrap: wrap;
            gap: 50px;
            margin-bottom: 60px;
        }

        .footer-brand {
            flex: 1.5;
            min-width: 280px;
        }

        .footer-brand .logo {
            margin-bottom: 20px;
        }

        .footer-brand p {
            color: var(--text-muted);
            line-height: 1.7;
            font-size: 15px;
            margin-bottom: 25px;
            max-width: 360px;
        }

        .footer-socials {
            display: flex;
            gap: 15px;
        }

        .footer-socials a {
            color: var(--text-white);
            display: flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.08);
            transition: all 0.3s ease;
        }

        .footer-socials a:hover {
            color: var(--bg-color);
            background-color: var(--accent-color);
            border-color: var(--accent-color);
            box-shadow: 0 0 15px var(--accent-glow);
            transform: translateY(-3px);
        }

        .footer-links-col {
            flex: 1;
            min-width: 160px;
        }

        .footer-links-col h3 {
            font-family: 'Playfair Display', serif;
            color: var(--accent-color);
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 25px;
            letter-spacing: 0.5px;
        }

        .footer-links-col ul {
            list-style: none;
        }

        .footer-links-col li {
            margin-bottom: 14px;
        }

        .footer-links-col a {
            color: var(--text-muted);
            text-decoration: none;
            font-size: 14.5px;
            transition: color 0.2s ease, padding-left 0.2s ease;
            display: inline-block;
        }

        .footer-links-col a:hover {
            color: var(--text-white);
            padding-left: 4px;
        }

        .footer-newsletter {
            flex: 1.5;
            min-width: 280px;
        }

        .footer-newsletter h3 {
            font-family: 'Playfair Display', serif;
            color: var(--accent-color);
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 25px;
        }

        .footer-newsletter p {
            color: var(--text-muted);
            font-size: 14.5px;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .subscribe-form {
            display: flex;
            position: relative;
            width: 100%;
            max-width: 340px;
        }

        .subscribe-form input {
            width: 100%;
            padding: 14px 20px;
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 30px;
            color: var(--text-white);
            font-family: 'Open Sans', sans-serif;
            font-size: 14px;
            outline: none;
            transition: border-color 0.3s ease;
        }

        .subscribe-form input:focus {
            border-color: var(--accent-color);
        }

        .subscribe-form button {
            position: absolute;
            right: 5px;
            top: 5px;
            bottom: 5px;
            padding: 0 20px;
            background-color: var(--accent-color);
            border: none;
            border-radius: 25px;
            color: var(--bg-color);
            font-weight: 700;
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            cursor: pointer;
            transition: opacity 0.2s ease;
        }

        .footer-bottom {
            padding-top: 35px;
            border-top: 1px solid rgba(255, 255, 255, 0.03);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .footer-bottom p {
            color: rgba(255, 255, 255, 0.3);
            font-size: 13px;
        }

        /* --- RESPONSIVE OPTIMIZATION LAYERS --- */
        @media (max-width: 1024px) {
            .navbar {
                position: relative;
                flex-direction: column;
                gap: 20px;
                padding: 25px 4%;
            }
            .nav-links { flex-wrap: wrap; gap: 12px 20px; margin: 10px 0;}
            .account-link { width: 100%; justify-content: center; }
            .about-header { flex-direction: column; padding-top: 60px; text-align: center; gap: 40px;}
            .header-visual { width: 100%; height: 350px; }
        }

        @media (max-width: 768px) {
            .footer-grid { flex-direction: column; gap: 40px; }
            .footer-bottom { flex-direction: column; text-align: center; }
        }
    </style>
</head>
<body>

<nav class="navbar" id="stickyNavbar">
    <div class="nav-logo-container">
        <a href="home.jsp" class="logo">GoTrek</a>
    </div>

    <div class="nav-links">
        <a href="home">Home</a>
        <a href="about">About us</a>
        <a href="tourpackage">Tour Packages</a>
        <a href="info">Tourist Info</a>
        <a href="blog">Blogs</a>
        <a href="gallery">Gallery</a>
        <a href="contact">Contact us</a>
    </div>

    <div class="account-link">
        <a href="#">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
            Account
        </a>
    </div>
</nav>

<header class="about-header">
    <div class="header-text">
        <h1>Who We Are & <br>Why We Venture.</h1>
        <p>Founded deep in the mountain paths, GoTrek was built out of a singular obsession: making the world's most beautiful, intimidating, and rewarding peaks accessible to those with a spirit for discovery.</p>
        <p>We don't just book trips. We map out terrain profiles, match gear setups down to the millimeter, and deploy experienced, certified safety experts to turn challenging expeditions into unforgettable milestones.</p>
    </div>
    <div class="header-visual"></div>
</header>

<section class="values-section">
    <h2 class="section-headline">Our Founding Values</h2>
    <div class="values-grid">
        <div class="value-card">
            <div class="value-icon">
                <svg width="36" height="36" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path></svg>
            </div>
            <h3>Safety First Layer</h3>
            <p>Every single step, ascent, and path is thoroughly vetted before your departure. Your security is our primary operational baseline.</p>
        </div>
        <div class="value-card">
            <div class="value-icon">
                <svg width="36" height="36" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polygon points="12 2 2 7 12 12 22 7 12 2"></polygon><polyline points="2 17 12 22 22 17"></polyline><polyline points="2 12 12 17 22 12"></polyline></svg>
            </div>
            <h3>Expert Frameworks</h3>
            <p>Our maps and tracking guides use professional alpine metrics to give you flawless data on your trail speed and topography metrics.</p>
        </div>
        <div class="value-card">
            <div class="value-icon">
                <svg width="36" height="36" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M2 22a10 10 0 1 1 20 0H2z"></path><circle cx="12" cy="8" r="4"></circle></svg>
            </div>
            <h3>Eco Protection</h3>
            <p>Leave zero structural footprints. We operate strictly under standard nature preservation and outdoor trail ethics.</p>
        </div>
    </div>
</section>

<section class="team-section">
    <center><h2 class="section-headline">Meet Our Expedition Leaders</h2></center>
    <div class="team-grid">
        <div class="team-card">
            <div class="team-img member-1"></div>
            <div class="team-info">
                <h4>Elena Rostova</h4>
                <span>Chief Alpine Guide</span>
            </div>
        </div>
        <div class="team-card">
            <div class="team-img member-2"></div>
            <div class="team-info">
                <h4>Marcus Vance</h4>
                <span>Safety Director</span>
            </div>
        </div>
        <div class="team-card">
            <div class="team-img member-3"></div>
            <div class="team-info">
                <h4>Sarah Jenkins</h4>
                <span>Survival Specialist</span>
            </div>
        </div>
    </div>
</section>

<footer class="main-footer">
    <div class="footer-grid">
        <div class="footer-brand">
            <a href="#" class="logo">GoTrek</a>
            <p>Get out into nature with the best equipment, routes, and tips from certified trail experts. We help you map your journey safely.</p>
            <div class="footer-socials">
                <a href="#"><svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg></a>
                <a href="#"><svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg></a>
                <a href="#"><svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path></svg></a>
            </div>
        </div>

        <div class="footer-links-col">
            <h3>More on GoTrek</h3>
            <ul>
                <li><a href="#">About GoTrek</a></li>
                <li><a href="#">Contributors & Team</a></li>
                <li><a href="#">Write For Us</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
        </div>

        <div class="footer-links-col">
            <h3>More Info</h3>
            <ul>
                <li><a href="#">The Team</a></li>
                <li><a href="#">Jobs & Careers</a></li>
                <li><a href="#">Press Kit</a></li>
            </ul>
        </div>

        <div class="footer-newsletter">
            <h3>Stay Updated</h3>
            <p>Subscribe to catch the latest trail reports, gear updates, and package drops.</p>
            <form class="subscribe-form" onsubmit="event.preventDefault();">
                <input type="email" placeholder="Your email address" required>
                <button type="submit">Join</button>
            </form>
        </div>
    </div>

    <div class="footer-bottom">
        <p>&copy; 2026 GoTrek Adventure Corp. Designed for the wild.</p>
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