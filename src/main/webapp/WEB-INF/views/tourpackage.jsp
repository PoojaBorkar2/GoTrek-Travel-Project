<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tour Packages | GoTrek Expeditions</title>

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
        ::-webkit-scrollbar { width: 8px; }
        ::-webkit-scrollbar-track { background: var(--bg-color); }
        ::-webkit-scrollbar-thumb { background: rgba(251, 215, 132, 0.3); border-radius: 4px; }
        ::-webkit-scrollbar-thumb:hover { background: var(--accent-color); }

        /* --- GLOBAL RESET --- */
        * { margin: 0; padding: 0; box-sizing: border-box; }

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
            background-color: rgba(11, 29, 38, 0.85);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.04);
            transition: all 0.5s cubic-bezier(0.25, 1, 0.5, 1);
        }

        .navbar.scrolled { padding: 18px 5%; box-shadow: 0 10px 40px rgba(0, 0, 0, 0.4); }

        .logo {
            font-family: 'Playfair Display', serif;
            font-size: 34px;
            font-weight: 700;
            letter-spacing: 1.5px;
            background: linear-gradient(120deg, #fff 0%, var(--accent-color) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-decoration: none;
            display: inline-block;
        }

        .nav-links { display: flex; align-items: center; justify-content: center; flex: 1 1 auto; gap: 28px; padding: 0 20px; }
        .nav-links a {
            color: var(--text-white); text-decoration: none; font-weight: 700; font-size: 14px; text-transform: uppercase;
            letter-spacing: 1px; position: relative; padding-bottom: 6px; transition: color 0.3s ease; white-space: nowrap;
        }
        .nav-links a::after {
            content: ''; position: absolute; bottom: 0; left: 50%; width: 0; height: 2px;
            background: linear-gradient(90deg, transparent, var(--accent-color), transparent);
            transition: width 0.4s cubic-bezier(0.25, 1, 0.5, 1), left 0.4s cubic-bezier(0.25, 1, 0.5, 1);
        }
        .nav-links a:hover::after { width: 100%; left: 0; }
        .nav-links a:hover, .account-link a:hover { color: var(--accent-color); }

        .account-link { flex: 0 0 auto; display: flex; justify-content: flex-end; }
        .account-link a {
            color: var(--text-white); text-decoration: none; font-weight: 700; font-size: 14px; text-transform: uppercase;
            letter-spacing: 1px; display: flex; align-items: center; gap: 10px; border: 1px solid rgba(255,255,255,0.15);
            padding: 10px 22px; border-radius: 30px; transition: all 0.3s ease; white-space: nowrap;
        }
        .account-link a:hover { border-color: var(--accent-color); box-shadow: 0 0 15px var(--accent-glow); background-color: rgba(251, 215, 132, 0.05); }

        /* --- IMMERSIVE SUBPAGE HEADER --- */
        .packages-header { padding: 180px 8% 40px 8%; text-align: center; max-width: 800px; margin: 0 auto; }
        .packages-header h1 { font-family: 'Playfair Display', serif; font-size: 56px; font-weight: 400; line-height: 1.2; margin-bottom: 20px; }
        .packages-header p { color: var(--text-muted); font-size: 16px; line-height: 1.8; }

        /* --- PACKAGES GRID SYSTEM --- */
        .packages-container { padding: 40px 8% 120px 8%; }
        .filter-wrapper { display: flex; justify-content: center; gap: 15px; margin-bottom: 60px; flex-wrap: wrap; }
        .filter-btn {
            background: none; border: 1px solid rgba(255, 255, 255, 0.1); color: var(--text-white); padding: 12px 28px;
            font-family: 'Open Sans', sans-serif; font-size: 13px; font-weight: 700; text-transform: uppercase;
            letter-spacing: 1.5px; border-radius: 30px; cursor: pointer; transition: all 0.3s cubic-bezier(0.25, 1, 0.5, 1);
        }
        .filter-btn.active, .filter-btn:hover { border-color: var(--accent-color); color: var(--accent-color); background: rgba(251, 215, 132, 0.03); box-shadow: 0 0 15px rgba(251, 215, 132, 0.1); }

        .packages-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(340px, 1fr)); gap: 40px; }
        .package-card {
            background: var(--card-bg); border: 1px solid var(--card-border); border-radius: 16px; overflow: hidden;
            backdrop-filter: blur(8px); -webkit-backdrop-filter: blur(8px); box-shadow: 0 30px 60px rgba(0,0,0,0.15);
            transition: all 0.5s cubic-bezier(0.25, 1, 0.5, 1); display: flex; flex-direction: column; opacity: 1;
        }
        .package-card:hover { transform: translateY(-10px); border-color: rgba(251, 215, 132, 0.2); box-shadow: 0 40px 80px rgba(0,0,0,0.4), 0 0 30px rgba(251, 215, 132, 0.05); }

        .card-img-box { position: relative; height: 250px; background-size: cover; background-position: center; transition: transform 0.5s ease; }
        .package-card:hover .card-img-box { transform: scale(1.02); }

        .card-tag {
            position: absolute; top: 20px; left: 20px; background-color: var(--bg-color); color: var(--accent-color);
            padding: 6px 14px; font-size: 11px; font-weight: 700; text-transform: uppercase; letter-spacing: 1px;
            border-radius: 20px; border: 1px solid rgba(251, 215, 132, 0.2);
        }

        .card-content { padding: 30px; display: flex; flex-direction: column; flex-grow: 1; }
        .card-content h2 { font-family: 'Playfair Display', serif; font-size: 24px; font-weight: 400; margin-bottom: 15px; line-height: 1.3; }
        .card-content p { color: var(--text-muted); font-size: 14px; line-height: 1.6; margin-bottom: 25px; }

        .card-meta-metrics { display: flex; justify-content: space-between; padding: 15px 0; border-top: 1px solid rgba(255, 255, 255, 0.05); border-bottom: 1px solid rgba(255, 255, 255, 0.05); margin-bottom: 25px; }
        .metric-item { text-align: left; }
        .metric-item span { display: block; font-size: 11px; text-transform: uppercase; letter-spacing: 0.5px; color: var(--text-muted); margin-bottom: 4px; }
        .metric-item strong { font-size: 13px; color: var(--text-white); }

        .card-action-row { display: flex; justify-content: space-between; align-items: center; margin-top: auto; }
        .price-box { display: flex; flex-direction: column; }
        .price-box span { font-size: 11px; text-transform: uppercase; color: var(--text-muted); }
        .price-box strong { font-size: 22px; color: var(--accent-color); font-family: 'Playfair Display', serif; }

        .book-btn {
            background-color: transparent; border: 1px solid rgba(255,255,255,0.15); color: var(--text-white);
            padding: 10px 22px; border-radius: 30px; font-weight: 700; font-size: 13px; text-transform: uppercase;
            letter-spacing: 0.5px; cursor: pointer; transition: all 0.3s ease; text-decoration: none;
        }
        .book-btn:hover { border-color: var(--accent-color); background-color: var(--accent-color); color: var(--bg-color); box-shadow: 0 0 15px var(--accent-glow); }

        /* --- FOOTER STYLE --- */
        .main-footer { background-color: var(--footer-bg); padding: 80px 8% 40px 8%; border-top: 1px solid rgba(255, 255, 255, 0.05); }
        .footer-grid { display: flex; justify-content: space-between; align-items: flex-start; flex-wrap: wrap; gap: 50px; margin-bottom: 60px; }
        .footer-brand { flex: 1.5; min-width: 280px; }
        .footer-brand .logo { margin-bottom: 20px; }
        .footer-brand p { color: var(--text-muted); line-height: 1.7; font-size: 15px; margin-bottom: 25px; max-width: 360px; }

        .footer-socials { display: flex; gap: 15px; }
        .footer-socials a {
            color: var(--text-white); display: flex; align-items: center; justify-content: center; width: 40px; height: 40px;
            border-radius: 50%; background: rgba(255, 255, 255, 0.03); border: 1px solid rgba(255, 255, 255, 0.08); transition: all 0.3s ease;
        }
        .footer-socials a:hover { color: var(--bg-color); background-color: var(--accent-color); border-color: var(--accent-color); box-shadow: 0 0 15px var(--accent-glow); transform: translateY(-3px); }

        .footer-links-col { flex: 1; min-width: 160px; }
        .footer-links-col h3 { font-family: 'Playfair Display', serif; color: var(--accent-color); font-size: 18px; font-weight: 600; margin-bottom: 25px; }
        .footer-links-col ul { list-style: none; }
        .footer-links-col li { margin-bottom: 14px; }
        .footer-links-col a { color: var(--text-muted); text-decoration: none; font-size: 14.5px; transition: all 0.2s ease; }
        .footer-links-col a:hover { color: var(--text-white); padding-left: 4px; }

        .footer-newsletter { flex: 1.5; min-width: 280px; }
        .footer-newsletter h3 { font-family: 'Playfair Display', serif; color: var(--accent-color); font-size: 18px; font-weight: 600; margin-bottom: 25px; }
        .footer-newsletter p { color: var(--text-muted); font-size: 14.5px; line-height: 1.6; margin-bottom: 20px; }

        .subscribe-form { display: flex; position: relative; width: 100%; max-width: 340px; }
        .subscribe-form input { width: 100%; padding: 14px 20px; background: rgba(255, 255, 255, 0.03); border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 30px; color: var(--text-white); outline: none; }
        .subscribe-form input:focus { border-color: var(--accent-color); }
        .subscribe-form button { position: absolute; right: 5px; top: 5px; bottom: 5px; padding: 0 20px; background-color: var(--accent-color); border: none; border-radius: 25px; color: var(--bg-color); font-weight: 700; cursor: pointer; }

        .footer-bottom { padding-top: 35px; border-top: 1px solid rgba(255, 255, 255, 0.03); text-align: left; }
        .footer-bottom p { color: rgba(255, 255, 255, 0.3); font-size: 13px; }

        @media (max-width: 1024px) {
            .navbar { position: relative; flex-direction: column; gap: 20px; padding: 25px 4%; }
            .nav-links { flex-wrap: wrap; gap: 12px 20px; margin: 10px 0; }
            .account-link { width: 100%; justify-content: center; }
            .packages-header h1 { font-size: 42px; }
        }
        @media (max-width: 768px) { .footer-grid { flex-direction: column; gap: 40px; } }
    </style>
</head>
<body>

<nav class="navbar" id="stickyNavbar">
    <div class="nav-logo-container">
        <a href="${pageContext.request.contextPath}/" class="logo">GoTrek</a>
    </div>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/">Home</a>
        <a href="${pageContext.request.contextPath}/about">About us</a>
        <a href="${pageContext.request.contextPath}/tourpackage">Tour Packages</a>
        <a href="info">Tourist Info</a>
        <a href="blog">Blogs</a>
        <a href="gallery">Gallery</a>
        <a href="contact
">Contact us</a>
    </div>
    <div class="account-link">
        <a href="#">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
            Account
        </a>
    </div>
</nav>

<header class="packages-header">
    <h1>Our Expedition Packages</h1>
    <p>Explore our global database of 10 curated adventure tracks. Filter dynamically by geographic zones to begin planning your next wilderness benchmark.</p>
</header>

<main class="packages-container">
    <div class="filter-wrapper">
        <button class="filter-btn active" onclick="filterTracks('all', this)">All Regions</button>
        <button class="filter-btn" onclick="filterTracks('south-america', this)">South America</button>
        <button class="filter-btn" onclick="filterTracks('rajasthan', this)">Rajasthan</button>
        <button class="filter-btn" onclick="filterTracks('asia', this)">Asia Peaks</button>
    </div>

    <div class="packages-grid">

        <div class="package-card" data-region="south-america">
            <div class="card-img-box" style="background-image: url('https://images.unsplash.com/photo-1509024644558-2f56ce76c490?auto=format&fit=crop&w=600&q=80');">
                <span class="card-tag">Peru Andes</span>
            </div>
            <div class="card-content">
                <h2>The Ancient Inca Trail</h2>
                <p>Hike legendary stone pathways carved out by the Incan empire. Wind across cloud forest ecosystems up into the majestic Sun Gate overlooking Machu Picchu.</p>
                <div class="card-meta-metrics">
                    <div class="metric-item"><span>Duration</span><strong>4 Days</strong></div>
                    <div class="metric-item"><span>Elevation</span><strong>4,215m</strong></div>
                    <div class="metric-item"><span>Rating</span><strong>Strenuous</strong></div>
                </div>
                <div class="card-action-row">
                    <div class="price-box"><span>Per person</span><strong>$980</strong></div>
                    <a href="#" class="book-btn">Explore</a>
                </div>
            </div>
        </div>

        <div class="package-card" data-region="south-america">
            <div class="card-img-box" style="background-image: url('https://images.unsplash.com/photo-1519681393784-d120267933ba?auto=format&fit=crop&w=600&q=80');">
                <span class="card-tag">Chile</span>
            </div>
            <div class="card-content">
                <h2>Patagonia W-Trek Circuit</h2>
                <p>Traverse deep into the raw heart of Torres del Paine. Stand alongside rushing turquoise glacial lakes and massive granite pillars carved out by time.</p>
                <div class="card-meta-metrics">
                    <div class="metric-item"><span>Duration</span><strong>5 Days</strong></div>
                    <div class="metric-item"><span>Elevation</span><strong>3,000m</strong></div>
                    <div class="metric-item"><span>Rating</span><strong>Moderate</strong></div>
                </div>
                <div class="card-action-row">
                    <div class="price-box"><span>Per person</span><strong>$1,450</strong></div>
                    <a href="#" class="book-btn">Explore</a>
                </div>
            </div>
        </div>

        <div class="package-card" data-region="south-america">
            <div class="card-img-box" style="background-image: url('https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?auto=format&fit=crop&w=600&q=80');">
                <span class="card-tag">Chile Desert</span>
            </div>
            <div class="card-content">
                <h2>Atacama Horizon Safari</h2>
                <p>Explore the Martian landscapes of Earth's driest desert. Traverse expansive salt flats, active high-altitude geyser streams, and crystalline lagoons.</p>
                <div class="card-meta-metrics">
                    <div class="metric-item"><span>Duration</span><strong>4 Days</strong></div>
                    <div class="metric-item"><span>Elevation</span><strong>2,500m</strong></div>
                    <div class="metric-item"><span>Rating</span><strong>Easy</strong></div>
                </div>
                <div class="card-action-row">
                    <div class="price-box"><span>Per person</span><strong>$740</strong></div>
                    <a href="#" class="book-btn">Explore</a>
                </div>
            </div>
        </div>

        <div class="package-card" data-region="rajasthan">
            <div class="card-img-box" style="background-image: url('https://images.unsplash.com/photo-1605649487212-47bdab064df7?auto=format&fit=crop&w=600&q=80');">
                <span class="card-tag">Jaisalmer</span>
            </div>
            <div class="card-content">
                <h2>Great Thar Desert Dunes</h2>
                <p>An exotic sand safari navigating golden sand ridges on camelback. Spend crisp desert nights camping under completely unpolluted starlit skies.</p>
                <div class="card-meta-metrics">
                    <div class="metric-item"><span>Duration</span><strong>3 Days</strong></div>
                    <div class="metric-item"><span>Terrain</span><strong>Sand</strong></div>
                    <div class="metric-item"><span>Rating</span><strong>Easy</strong></div>
                </div>
                <div class="card-action-row">
                    <div class="price-box"><span>Per person</span><strong>$320</strong></div>
                    <a href="#" class="book-btn">Explore</a>
                </div>
            </div>
        </div>

        <div class="package-card" data-region="rajasthan">
            <div class="card-img-box" style="background-image: url('https://images.unsplash.com/photo-1597075687490-8f673c6c17f6?auto=format&fit=crop&w=600&q=80');">
                <span class="card-tag">Mount Abu</span>
            </div>
            <div class="card-content">
                <h2>Aravali Ancient Crest</h2>
                <p>Summit Guru Shikhar along India's oldest metamorphic mountain range. Explore rock-carved sanctuaries and hidden fortress viewpoints.</p>
                <div class="card-meta-metrics">
                    <div class="metric-item"><span>Duration</span><strong>4 Days</strong></div>
                    <div class="metric-item"><span>Elevation</span><strong>1,722m</strong></div>
                    <div class="metric-item"><span>Rating</span><strong>Moderate</strong></div>
                </div>
                <div class="card-action-row">
                    <div class="price-box"><span>Per person</span><strong>$410</strong></div>
                    <a href="#" class="book-btn">Explore</a>
                </div>
            </div>
        </div>

        <div class="package-card" data-region="rajasthan">
            <div class="card-img-box" style="background-image: url('https://images.unsplash.com/photo-1590050752117-238cb0fb12b1?auto=format&fit=crop&w=600&q=80');">
                <span class="card-tag">Mewar Region</span>
            </div>
            <div class="card-content">
                <h2>Kumbhalgarh Wall Track</h2>
                <p>Hike alongside the world's second-longest defensive masonry layout. Walk historic fortification paths wrapping around ancient Mewar ruins.</p>
                <div class="card-meta-metrics">
                    <div class="metric-item"><span>Duration</span><strong>3 Days</strong></div>
                    <div class="metric-item"><span>Elevation</span><strong>1,100m</strong></div>
                    <div class="metric-item"><span>Rating</span><strong>Easy</strong></div>
                </div>
                <div class="card-action-row">
                    <div class="price-box"><span>Per person</span><strong>$290</strong></div>
                    <a href="#" class="book-btn">Explore</a>
                </div>
            </div>
        </div>

        <div class="package-card" data-region="asia">
            <div class="card-img-box" style="background-image: url('https://images.unsplash.com/photo-1509023464722-18d996393ca8?auto=format&fit=crop&w=600&q=80');">
                <span class="card-tag">Japan</span>
            </div>
            <div class="card-content">
                <h2>The Fuji Pilgrimage Path</h2>
                <p>Ascend the distinct volcanic stone tracks of Japan's sacred mountain. Arrive at the summit crater just in time for the historic golden dawn.</p>
                <div class="card-meta-metrics">
                    <div class="metric-item"><span>Duration</span><strong>2 Days</strong></div>
                    <div class="metric-item"><span>Elevation</span><strong>3,776m</strong></div>
                    <div class="metric-item"><span>Rating</span><strong>Moderate</strong></div>
                </div>
                <div class="card-action-row">
                    <div class="price-box"><span>Per person</span><strong>$550</strong></div>
                    <a href="#" class="book-btn">Explore</a>
                </div>
            </div>
        </div>

        <div class="package-card" data-region="asia">
            <div class="card-img-box" style="background-image: url('https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?auto=format&fit=crop&w=600&q=80');">
                <span class="card-tag">Nepal Himalayas</span>
            </div>
            <div class="card-content">
                <h2>Khumbu Glacier Footpath</h2>
                <p>The definitive test of endurance. Navigate past high sherpa towns and icy mountain bridges right up to the base of the world's highest ridge.</p>
                <div class="card-meta-metrics">
                    <div class="metric-item"><span>Duration</span><strong>12 Days</strong></div>
                    <div class="metric-item"><span>Elevation</span><strong>5,364m</strong></div>
                    <div class="metric-item"><span>Rating</span><strong>Expert</strong></div>
                </div>
                <div class="card-action-row">
                    <div class="price-box"><span>Per person</span><strong>$2,400</strong></div>
                    <a href="#" class="book-btn">Explore</a>
                </div>
            </div>
        </div>

        <div class="package-card" data-region="asia">
            <div class="card-img-box" style="background-image: url('https://images.unsplash.com/photo-1544735716-392fe2489ffa?auto=format&fit=crop&w=600&q=80');">
                <span class="card-tag">Malaysia</span>
            </div>
            <div class="card-content">
                <h2>Kinabalu Rainforest Crest</h2>
                <p>Climb from dense tropical jungle lowlands through changing ecological layers up onto smooth, raw alpine granite plates at the summit.</p>
                <div class="card-meta-metrics">
                    <div class="metric-item"><span>Duration</span><strong>3 Days</strong></div>
                    <div class="metric-item"><span>Elevation</span><strong>4,095m</strong></div>
                    <div class="metric-item"><span>Rating</span><strong>Strenuous</strong></div>
                </div>
                <div class="card-action-row">
                    <div class="price-box"><span>Per person</span><strong>$680</strong></div>
                    <a href="#" class="book-btn">Explore</a>
                </div>
            </div>
        </div>

        <div class="package-card" data-region="asia">
            <div class="card-img-box" style="background-image: url('https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=600&q=80');">
                <span class="card-tag">Nepal</span>
            </div>
            <div class="card-content">
                <h2>Annapurna Sanctuary Matrix</h2>
                <p>Walk a unique high-altitude amphitheater rimmed entirely by giant peaks. Pass farming terraces, deep bamboo valleys, and ice cascades.</p>
                <div class="card-meta-metrics">
                    <div class="metric-item"><span>Duration</span><strong>10 Days</strong></div>
                    <div class="metric-item"><span>Elevation</span><strong>4,130m</strong></div>
                    <div class="metric-item"><span>Rating</span><strong>Expert</strong></div>
                </div>
                <div class="card-action-row">
                    <div class="price-box"><span>Per person</span><strong>$1,850</strong></div>
                    <a href="#" class="book-btn">Explore</a>
                </div>
            </div>
        </div>

    </div>
</main>

<footer class="main-footer">
    <div class="footer-grid">
        <div class="footer-brand">
            <a href="#" class="logo">GoTrek</a>
            <p>Get out into nature with the best equipment, routes, and tips from certified trail experts.</p>
            <div class="footer-socials">
                <a href="#"><svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg></a>
                <a href="#"><svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path></svg></a>
            </div>
        </div>
        <div class="footer-links-col">
            <h3>More on GoTrek</h3>
            <ul>
                <li><a href="about">About Us</a></li>
                <li><a href="contact">Contact Us</a></li>
            </ul>
        </div>
        <div class="footer-newsletter">
            <h3>Stay Updated</h3>
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

    function filterTracks(region, eventButton) {
        const buttons = document.querySelectorAll('.filter-btn');
        buttons.forEach(btn => btn.classList.remove('active'));
        eventButton.classList.add('active');

        const cards = document.querySelectorAll('.package-card');
        cards.forEach(card => {
            if (region === 'all' || card.getAttribute('data-region') === region) {
                card.style.display = 'flex';
                setTimeout(() => card.style.opacity = '1', 50);
            } else {
                card.style.opacity = '0';
                card.style.display = 'none';
            }
        });
    }
</script>

</body>
</html>