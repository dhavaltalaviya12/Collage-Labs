import { Link, Outlet } from 'react-router-dom';
import Logo from './logo.svg';

function Layout() {
    return (
        <>
            <div className="container">
                <div className="row">
                    <div class="col-3">
                        <img height="100%" width="100%" src="https://darshan.ac.in/Content/media/DU_Logo.svg" />
                    </div>
                    <div className="col">
                        <nav class="navbar navbar-expand-lg bg-body-tertiary">
                            <div class="container-fluid">
                                <div class="collapse navbar-collapse" id="navbarNav">
                                    <Link className="navl-link mx-5" to="/person">Person</Link>
                                    <Link className="navl-link active mx-5 " to="/Home">Home</Link>
                                    <Link className="navl-link mx-5" to="/About">About</Link>
                                    <Link className="navl-link mx-5" to="/Contact">Contact</Link>
                                </div>
                            </div>
                        </nav></div>
                </div>
                <div className="row">
                    <div className="col text-center"> <Outlet /> </div>
                </div>
                <div className="row">
                    <div className="col border border-success"><div class="footer">
                        <div class="footername text-center">@Darshan University - Rajkot</div>
                    </div></div>
                </div>
            </div>
        </>
    )
}

export default Layout;