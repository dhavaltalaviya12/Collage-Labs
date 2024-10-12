import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import HelloWorld from './HelloWorld';
import Layout from './Layout';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import Home from './Home';
import About from './About';
import Contact from './Contact';
import HooksDemo from './HooksDemo';
import PersonDetails from './PersonDetails';
import AddPerson from './AddPerson';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <>
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Layout />}>
          <Route path='/person' element={<HooksDemo />} />
          <Route path='/person/:id' element={<PersonDetails />} />
          <Route path='/person/add' element={<AddPerson />} />
          <Route path="/Home" element={<Home />} />
          <Route path="/About" element={<About />} />
          <Route path="/Contact" element={<Contact />} />
        </Route>
      </Routes>
    </BrowserRouter>

  </>
);
