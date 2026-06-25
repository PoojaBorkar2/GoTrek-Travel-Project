<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Headquarters | GoTrek</title>

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

        /* --- HERO SPACE BLOCK --- */
        .contact-hero {
            min-height: 38vh;
            width: 100%;
            display: flex; flex-direction: column; justify-content: center; align-items: center;
            text-align: center;
            padding: 140px 10% 10px 10%;
            background: radial-gradient(circle at center, rgba(15, 42, 56, 0.5) 0%, var(--bg-deep) 70%);
        }
        .contact-hero h1 {
            font-family: 'Poppins', sans-serif; font-size: clamp(34px, 4.5vw, 52px); font-weight: 700;
            margin-bottom: 20px; letter-spacing: -0.5px; line-height: 1.2;
        }
        .contact-hero p { max-width: 600px; font-size: 16px; color: var(--text-dim); line-height: 1.8; }

        /* --- SPLIT MAIN CORE INTERFACE --- */
        .contact-wrapper {
            max-width: 1200px; margin: 0 auto 120px auto; padding: 0 4%;
            display: grid; grid-template-columns: 1.1fr 1.4fr; gap: 50px; align-items: start;
        }

        /* --- LEFT SIDE: INFO INTERFACE CARD --- */
        .info-pane {
            background: var(--glass-bg); border: 1px solid var(--glass-border);
            padding: 50px; border-radius: 32px; backdrop-filter: blur(10px);
            box-shadow: 0 20px 50px rgba(0,0,0,0.2);
        }
        .info-pane h2 { font-family: 'Poppins', sans-serif; font-size: 26px; font-weight: 600; margin-bottom: 20px; }
        .info-pane > p { color: var(--text-dim); font-size: 15px; margin-bottom: 40px; line-height: 1.7; }

        .comms-channels { display: flex; flex-direction: column; gap: 30px; }
        .channel-node { display: flex; align-items: flex-start; gap: 20px; }

        .icon-vault {
            width: 50px; height: 50px; border-radius: 16px; background: rgba(251, 215, 132, 0.05);
            border: 1px solid rgba(251, 215, 132, 0.2); display: flex; align-items: center; justify-content: center;
            color: var(--accent-gold); font-size: 18px; flex-shrink: 0; transition: all 0.3s ease;
        }
        .channel-node:hover .icon-vault {
            background: var(--accent-gold); color: var(--bg-deep); box-shadow: 0 0 15px var(--gold-glow);
            transform: scale(1.05);
        }

        .channel-meta h4 { font-family: 'Poppins', sans-serif; font-size: 15px; font-weight: 600; color: var(--accent-gold); margin-bottom: 4px; text-transform: uppercase; letter-spacing: 0.5px;}
        .channel-meta p { color: var(--text-pure); font-size: 15px; font-weight: 500; }
        .channel-meta span { color: var(--text-dim); font-size: 13px; display: block; margin-top: 2px; }

        /* --- RIGHT SIDE: GLASS ENGINE FORM --- */
        .form-pane {
            background: rgba(255, 255, 255, 0.01); border: 1px solid var(--glass-border);
            padding: 50px; border-radius: 32px; backdrop-filter: blur(10px);
            box-shadow: 0 25px 60px rgba(0,0,0,0.15);
        }

        .form-grid-row { display: grid; grid-template-columns: repeat(2, 1fr); gap: 25px; margin-bottom: 25px; }
        .input-group { position: relative; width: 100%; margin-bottom: 25px; }
        .form-grid-row .input-group { margin-bottom: 0; }

        .input-group input, .input-group textarea {
            width: 100%; padding: 16px 20px; background: rgba(255, 255, 255, 0.02);
            border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 14px;
            color: var(--text-pure); font-family: 'Lato', sans-serif; font-size: 15px; outline: none;
            transition: all 0.3s ease;
        }
        .input-group textarea { height: 150px; resize: none; }

        /* FLOATING LABEL ARCHITECTURE */
        .input-group label {
            position: absolute; left: 20px; top: 16px; color: var(--text-dim);
            font-size: 15px; pointer-events: none; transition: all 0.3s cubic-bezier(0.25, 1, 0.5, 1);
        }

        /* Actions when user types or focuses element */
        .input-group input:focus, .input-group textarea:focus { border-color: var(--accent-gold); background: rgba(15, 42, 56, 0.2); }

        .input-group input:focus ~ label,
        .input-group input:not(:placeholder-shown) ~ label,
        .input-group textarea:focus ~ label,
        .input-group textarea:not(:placeholder-shown) ~ label {
            top: -10px; left: 12px; font-size: 12px; font-weight: 700;
            color: var(--accent-gold); background: #0C212E; padding: 2px 10px; border-radius: 6px;
        }

        .submit-btn {
            width: 100%; padding: 16px; background: var(--accent-gold); border: none;
            border-radius: 14px; color: var(--bg-deep); font-family: 'Poppins', sans-serif;
            font-size: 14px; font-weight: 700; text-transform: uppercase; letter-spacing: 1px;
            cursor: pointer; transition: all 0.4s cubic-bezier(0.25, 1, 0.5, 1);
        }
        .submit-btn:hover {
            background-color: #FFFFFF; box-shadow: 0 10px 30px rgba(251, 215, 132, 0.25);
            transform: translateY(-2px);
        }

        /* --- FOOTER SECTION --- */
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

        /* --- RESPONSIVE SYSTEMS --- */
        @media (max-width: 1000px) {
            .contact-wrapper { grid-template-columns: 1fr; gap: 40px; }
            .navbar { padding: 20px 4%; }
            .nav-links { display: none; }
            .contact-hero { padding-top: 120px; }
            .footer-grid { flex-direction: column; gap: 40px; }
        }
        @media (max-width: 600px) {
            .form-grid-row { grid-template-columns: 1fr; gap: 25px; }
            .info-pane, .form-pane { padding: 30px 20px; }
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
        <a href="${pageContext.request.contextPath}/gallery">Gallery</a>
        <a href="${pageContext.request.contextPath}/contact" class="active">Contact Us</a>
    </div>
    <div class="account-link">
        <a href="#">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
            Account
        </a>
    </div>
</nav>

<header class="contact-hero">
    <p style="color: var(--accent-gold); text-transform: uppercase; letter-spacing: 6px; font-weight: 700; margin-bottom: 15px; font-size: 12px;">Communications Portal</p>
    <h1>Connect With Headquarters</h1>
    <p>Have route telemetry concerns, custom expedition requirements, or hardware mapping inquiries? Establish a line directly to our response grid.</p>
</header>

<main class="contact-wrapper">

    <section class="info-pane">
        <h2>Operations Base</h2>
        <p>Our tracking coordinates are constantly actively managed. Get in touch via any of our available terminal nodes below.</p>

        <div class="comms-channels">
            <div class="channel-node">
                <div class="icon-vault"><i class="fa-solid fa-map-location-dot"></i></div>
                <div class="channel-meta">
                    <h4>Grid Coordinates</h4>
                    <p>High-Altitude Ridge Suite 404</p>
                    <span>Sector 7, Pune, MH, India</span>
                </div>
            </div>

            <div class="channel-node">
                <div class="icon-vault"><i class="fa-solid fa-satellite-dish"></i></div>
                <div class="channel-meta">
                    <h4>Direct Sat-Line</h4>
                    <p>+91 98765 43210</p>
                    <span>Mon - Sat | 0800 hrs - 1800 hrs</span>
                </div>
            </div>

            <div class="channel-node">
                <div class="icon-vault"><i class="fa-solid fa-envelope-open-text"></i></div>
                <div class="channel-meta">
                    <h4>Secure Encrypted Mail</h4>
                    <p>operations@gotrek.com</p>
                    <span>Average matrix response: < 2 Hours</span>
                </div>
            </div>
        </div>
    </section>

    <section class="form-pane">
        <form action="#" method="POST" onsubmit="event.preventDefault(); alert('Telemetry transmitted successfully!');">
            <div class="form-grid-row">
                <div class="input-group">
                    <input type="text" id="userName" placeholder=" " required autocomplete="off">
                    <label for="userName">Your Full Name</label>
                </div>
                <div class="input-group">
                    <input type="email" id="userEmail" placeholder=" " required autocomplete="off">
                    <label for="userEmail">Secure Email Address</label>
                </div>
            </div>

            <div class="input-group">
                <input type="text" id="msgSubject" placeholder=" " required autocomplete="off">
                <label for="msgSubject">Inquiry Core Subject</label>
            </div>

            <div class="input-group">
                <textarea id="msgBody" placeholder=" " required></textarea>
                <label for="msgBody">Transmit message details here...</label>
            </div>

            <button type="submit" class="submit-btn">Transmit Stream</button>
        </form>
    </section>

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
    // --- STICKY NAVIGATION CONTROLLER ---
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
</script>

</body>
</html>