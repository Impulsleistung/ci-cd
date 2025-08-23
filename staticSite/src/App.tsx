import React from 'react';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import Home from './Home';
import About from './About';
import Contact from './Contact';

const App: React.FC = () => {
  return (
    <Router>
      <div className="mdl-layout mdl-js-layout mdl-layout--fixed-header">
        <header className="mdl-layout__header">
          <div className="mdl-layout__header-row">
            <span className="mdl-layout-title">My Personal Homepage</span>
            <div className="mdl-layout-spacer"></div>
            <nav className="mdl-navigation">
              <Link className="mdl-navigation__link" to="/">Home</Link>
              <Link className="mdl-navigation__link" to="/about">About</Link>
              <Link className="mdl-navigation__link" to="/contact">Contact</Link>
            </nav>
          </div>
        </header>
        <main className="mdl-layout__content">
          <div className="page-content">
            <Routes>
              <Route path="/" element={<Home />} />
              <Route path="/about" element={<About />} />
              <Route path="/contact" element={<Contact />} />
            </Routes>
          </div>
        </main>
      </div>
    </Router>
  );
};

export default App;
