<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GoTrek | Be Prepared for the Mountains and Beyond!</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght=0,400;0,600;0,700;1,400&family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">

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
            background-color: rgba(11, 29, 38, 0);
            backdrop-filter: blur(0px);
            -webkit-backdrop-filter: blur(0px);
            transition: all 0.5s cubic-bezier(0.25, 1, 0.5, 1);
        }

        .navbar.scrolled {
            padding: 18px 5%;
            background-color: rgba(11, 29, 38, 0.85);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.4);
            border-bottom: 1px solid rgba(255, 255, 255, 0.04);
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

        .navbar.scrolled .logo {
            transform: scale(0.95);
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

        /* --- IMMERSIVE HERO SECTION --- */
        .hero-section {
            position: relative;
            height: 100vh;
            width: 100%;
            background-image:
                    linear-gradient(180deg, rgba(11, 29, 38, 0.3) 0%, rgba(11, 29, 38, 0.85) 80%, #0B1D26 100%),
                    url('https://images.unsplash.com/photo-1454496522488-7a8e488e8606?auto=format&fit=crop&w=1600&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0 8%;
        }

        .hero-content {
            max-width: 900px;
            width: 100%;
            text-align: left;
            margin-top: 60px;
            animation: fadeInUp 1.2s ease-out;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .tagline {
            color: var(--accent-color);
            text-transform: uppercase;
            letter-spacing: 7px;
            font-size: 13px;
            display: flex;
            align-items: center;
            gap: 24px;
            font-weight: 700;
            margin-bottom: 28px;
            text-shadow: 0 2px 10px rgba(0,0,0,0.5);
        }

        .tagline::before {
            content: '';
            display: inline-block;
            width: 80px;
            height: 2px;
            background: linear-gradient(90deg, var(--accent-color), transparent);
        }

        .hero-content h1 {
            font-family: 'Playfair Display', serif;
            font-size: 80px;
            line-height: 1.15;
            font-weight: 400;
            margin-bottom: 35px;
            text-shadow: 0 4px 20px rgba(0,0,0,0.6);
        }

        .scroll-down {
            font-size: 15px;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            display: inline-flex;
            align-items: center;
            gap: 12px;
            color: var(--text-white);
            text-decoration: none;
            transition: transform 0.3s ease;
        }

        .scroll-down span {
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
            40% { transform: translateY(-6px); }
            60% { transform: translateY(-3px); }
        }

        .scroll-down:hover {
            color: var(--accent-color);
            transform: translateY(3px);
        }

        /* --- DYNAMIC CONTENT STREAM CONTAINER --- */
        .content-stream {
            padding: 160px 10% 80px 10%;
        }

        .grid-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 220px;
            gap: 8%;
        }

        .grid-section.reverse {
            flex-direction: row-reverse;
        }

        .text-block {
            flex: 1.2;
            position: relative;
            padding: 40px;
            background: var(--card-bg);
            border: 1px solid var(--card-border);
            border-radius: 16px;
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            box-shadow: 0 30px 60px rgba(0,0,0,0.2);
            transition: border-color 0.4s ease, transform 0.4s ease;
        }

        .text-block:hover {
            border-color: rgba(251, 215, 132, 0.15);
            transform: translateY(-5px);
        }

        .step-num {
            font-size: 240px;
            font-weight: 700;
            color: rgba(251, 215, 132, 0.03);
            position: absolute;
            top: -160px;
            left: -20px;
            z-index: 1;
            user-select: none;
            font-family: 'Open Sans', sans-serif;
        }

        .section-tag {
            color: var(--accent-color);
            text-transform: uppercase;
            letter-spacing: 5px;
            font-size: 13px;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 16px;
            margin-bottom: 24px;
            position: relative;
            z-index: 2;
        }

        .section-tag::before {
            content: '';
            display: inline-block;
            width: 40px;
            height: 2px;
            background-color: var(--accent-color);
        }

        .text-block h2 {
            font-family: 'Playfair Display', serif;
            font-size: 52px;
            font-weight: 400;
            margin-bottom: 24px;
            line-height: 1.2;
            position: relative;
            z-index: 2;
        }

        .text-block p {
            color: var(--text-muted);
            line-height: 1.9;
            margin-bottom: 35px;
            font-size: 16px;
        }

        /* --- PREMIUM BUTTON DESIGN --- */
        .read-more {
            background: none;
            border: none;
            font-family: 'Open Sans', sans-serif;
            color: var(--accent-color);
            font-weight: 700;
            font-size: 15px;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 10px;
            cursor: pointer;
            padding: 8px 0;
            position: relative;
        }

        .read-more svg {
            transition: transform 0.3s cubic-bezier(0.25, 1, 0.5, 1);
        }

        .read-more:hover svg {
            transform: translateX(8px);
        }

        /* --- INTERACTIVE EXPANDED DISPLAY BOX --- */
        .inline-info-box {
            background-color: var(--info-box-bg);
            border-left: 4px solid var(--accent-color);
            border-top: 1px solid var(--info-box-border);
            border-right: 1px solid var(--info-box-border);
            border-bottom: 1px solid var(--info-box-border);
            padding: 28px;
            border-radius: 0 12px 12px 0;
            margin-top: 25px;
            box-shadow: inset 0 0 20px rgba(0,0,0,0.2);

            display: none;
            opacity: 0;
            transform: translateY(-15px);
            transition: opacity 0.4s cubic-bezier(0.25, 1, 0.5, 1), transform 0.4s cubic-bezier(0.25, 1, 0.5, 1);
        }

        .inline-info-box h4 {
            font-family: 'Playfair Display', serif;
            color: var(--accent-color);
            font-size: 20px;
            margin-bottom: 16px;
            font-weight: 600;
        }

        .inline-info-box ul {
            padding-left: 20px;
            color: var(--text-muted);
        }

        .inline-info-box li {
            margin-bottom: 12px;
            font-size: 14.5px;
            line-height: 1.7;
        }

        .inline-info-box li strong {
            color: var(--text-white);
        }

        /* --- CINEMATIC HOVER IMAGE CARDS --- */
        .image-block {
            flex: 0.8;
            height: 620px;
            background-size: cover;
            background-position: center;
            border-radius: 12px;
            box-shadow: 0 30px 60px rgba(0,0,0,0.5);
            align-self: center;
            position: relative;
            overflow: hidden;
            transition: transform 0.6s cubic-bezier(0.25, 1, 0.5, 1), box-shadow 0.6s cubic-bezier(0.25, 1, 0.5, 1);
        }

        .image-block::before {
            content: '';
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
            background: linear-gradient(180deg, transparent 50%, rgba(11,29,38,0.4) 100%);
            z-index: 2;
            transition: opacity 0.4s ease;
        }

        .image-block:hover {
            transform: scale(1.03) translateY(-5px);
            box-shadow: 0 40px 80px rgba(0,0,0,0.7), 0 0 40px rgba(251, 215, 132, 0.1);
        }

        /* --- CORE IMAGES --- */
        .img-1 { background-image: url('https://images.unsplash.com/photo-1501555088652-021faa106b9b?auto=format&fit=crop&w=800&q=80'); }
        .img-2 { background-image: url('https://images.pexels.com/photos/618848/pexels-photo-618848.jpeg?auto=compress&cs=tinysrgb&w=800'); }
        .img-3 { background-image: url('https://images.unsplash.com/photo-1513836279014-a89f7a76ae86?auto=format&fit=crop&w=800&q=80'); }

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

        .subscribe-form button:hover {
            opacity: 0.9;
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

        .footer-bottom-links a {
            color: rgba(255, 255, 255, 0.3);
            text-decoration: none;
            font-size: 13px;
            margin-left: 24px;
            transition: color 0.2s ease;
        }

        .footer-bottom-links a:hover {
            color: var(--text-white);
        }

        /* --- RESPONSIVE OPTIMIZATION LAYERS --- */
        @media (max-width: 1200px) {
            .hero-content h1 { font-size: 64px; }
            .text-block h2 { font-size: 42px; }
            .content-stream { padding: 120px 6% 60px 6%; }
            .nav-links { gap: 14px; }
        }

        @media (max-width: 1024px) {
            .navbar, .navbar.scrolled {
                position: relative;
                flex-direction: column;
                gap: 20px;
                padding: 25px 4%;
                background-color: rgba(11, 29, 38, 0.95);
            }
            .nav-links {
                flex-wrap: wrap;
                gap: 12px 20px;
                margin: 10px 0;
            }
            .nav-links a { margin: 0; }
            .account-link { width: 100%; justify-content: center; }
            .hero-section { height: calc(100vh - 180px); background-attachment: scroll; }
        }

        @media (max-width: 768px) {
            .grid-section, .grid-section.reverse {
                flex-direction: column !important;
                gap: 50px;
                margin-bottom: 120px;
            }
            .image-block { width: 100%; height: 420px; }
            .hero-content h1 { font-size: 42px; }
            .step-num { font-size: 16px; top: -110px; }
            .footer-grid { flex-direction: column; gap: 40px; }
            .footer-bottom { flex-direction: column; text-align: center; }
            .footer-bottom-links a { margin: 0 12px; }
        }
    </style>
</head>
<body>

<nav class="navbar" id="stickyNavbar">
    <div class="nav-logo-container">
        <a href="#" class="logo">GoTrek</a>
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

<header class="hero-section">
    <div class="hero-content">
        <span class="tagline">By POOJA BORKAR</span>
        <h1>Be prepared for the Mountains and beyond!</h1>
        <a href="#content" class="scroll-down">
            Explore and plan <span>&darr;</span>
        </a>
    </div>
</header>

<main class="content-stream" id="content">

    <section class="grid-section">
        <div class="text-block">
            <span class="step-num">01</span>
            <span class="section-tag">Get Started</span>
            <h2>What level of hiker are you?</h2>
            <p>Determining what level of hiker you are can be an important tool when planning future hikes. This hiking level guide will help you plan hikes according to different hike ratings set by various websites like All Trails and Modern Hiker.</p>
            <button class="read-more" onclick="toggleInfo('info1')">
                read more
                <svg width="18" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
            </button>

            <div class="inline-info-box" id="info1">
                <h4>Hiker Classification Levels:</h4>
                <ul>
                    <li><strong>Novice Hiker:</strong> Flat terrain, well-marked paths, and distances under 3 miles.</li>
                    <li><strong>Moderate Hiker:</strong> Up to 5–8 miles with modest elevation changes under 1,000 feet.</li>
                    <li><strong>Expert Hiker:</strong> Steep ascents, rocky scrambles, off-trail navigation, and multi-day treks.</li>
                </ul>
            </div>
        </div>
        <div class="image-block img-1"></div>
    </section>

    <section class="grid-section reverse">
        <div class="text-block">
            <span class="step-num">02</span>
            <span class="section-tag">Hiking Essentials</span>
            <h2>Picking the right Hiking Gear!</h2>
            <p>The nice thing about beginning hiking is that you don't really need any special gear, you can probably get away with things you already have. Let's start with clothing choices and common gear mistakes.</p>
            <button class="read-more" onclick="toggleInfo('info2')">
                read more
                <svg width="18" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
            </button>

            <div class="inline-info-box" id="info2">
                <h4>The Essential Gear Checklist:</h4>
                <ul>
                    <li><strong>Moisture-Wicking Layers:</strong> Avoid cotton completely; use polyester or wool.</li>
                    <li><strong>Footwear:</strong> Choose trail shoes or boots with deep rubber traction profiles.</li>
                    <li><strong>The Basics:</strong> Navigation tools, adequate water, nutrition packets, and a first-aid pouch.</li>
                </ul>
            </div>
        </div>
        <div class="image-block img-2"></div>
    </section>

    <section class="grid-section">
        <div class="text-block">
            <span class="step-num">03</span>
            <span class="section-tag">where you go is the key</span>
            <h2>Understand Your Map & Timing</h2>
            <p>To start, print out the hiking guide and map. Read over the guide, study the map, and have a good idea of what to expect. Knowing your landmarks ensures a safe journey.</p>
            <button class="read-more" onclick="toggleInfo('info3')">
                read more
                <svg width="18" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
            </button>

            <div class="inline-info-box" id="info3">
                <h4>Navigation & Timing Guide:</h4>
                <ul>
                    <li><strong>Pacing Math:</strong> Budget an average speed of 2 mph, adding 1 hour per 1,000 ft of climb.</li>
                    <li><strong>Contour Reading:</strong> Always evaluate topographical intervals to plan ahead for steep grades.</li>
                    <li><strong>Offline Maps:</strong> Pre-download map cache folders before your route loses network service.</li>
                </ul>
            </div>
        </div>
        <div class="image-block img-3"></div>
    </section>

</main>

<footer class="main-footer">
    <div class="footer-grid">
        <div class="footer-brand">
            <a href="#" class="logo">GoTrek</a>
            <p>Get out into nature with the best equipment, routes, and tips from certified trail experts. We help you map your journey safely.</p>
            <div class="footer-socials">
                <a href="#">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg>
                </a>
                <a href="#">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg>
                </a>
                <a href="#">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path></svg>
                </a>
            </div>
        </div>

        <div class="footer-links-col">
            <h3>More on GoTrek</h3>
            <ul>
                <li><a href="#">About GoTrek</a></li>
                <li><a href="#">Contributors & Team</a></li>
                <li><a href="#">Write For Us</a></li>
                <li><a href="#">Contact Us</a></li>
                <li><a href="#">Privacy Policy</a></li>
            </ul>
        </div>

        <div class="footer-links-col">
            <h3>More Info</h3>
            <ul>
                <li><a href="#">The Team</a></li>
                <li><a href="#">Jobs & Careers</a></li>
                <li><a href="#">Press Kit</a></li>
                <li><a href="#">Trail Guidelines</a></li>
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
        <div class="footer-bottom-links">
            <a href="#">Terms of Use</a>
            <a href="#">Security Map</a>
        </div>
    </div>
</footer>

<script>
    // NAVBAR SCROLL TRANSITION EFFECT
    window.onscroll = function() {
        var navbar = document.getElementById("stickyNavbar");
        if (window.scrollY > 40) {
            navbar.classList.add("scrolled");
        } else {
            navbar.classList.remove("scrolled");
        }
    };

    // ACCORDION TOGGLE CONTROLLER
    function toggleInfo(boxId) {
        var infoBox = document.getElementById(boxId);
        if (infoBox.style.display === "block") {
            infoBox.style.opacity = "0";
            infoBox.style.transform = "translateY(-15px)";
            setTimeout(function() {
                infoBox.style.display = "none";
            }, 400);
        } else {
            infoBox.style.display = "block";
            setTimeout(function() {
                infoBox.style.opacity = "1";
                infoBox.style.transform = "translateY(0)";
            }, 10);
        }
    }
</script>

</body>
</html>