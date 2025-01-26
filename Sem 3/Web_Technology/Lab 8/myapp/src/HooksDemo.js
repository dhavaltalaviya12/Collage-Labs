import { useEffect, useState } from "react";
import logo from './logo.svg';
import { Link } from "react-router-dom";


function HooksDemo() {

    const [person, setPerson] = useState([]);

    useEffect(() => {
        let apiUrl = "https://66e8f84c87e417609447a09a.mockapi.io/dhaval";
        fetch(apiUrl).then((res) => res.json())
            .then((res) => setPerson(res));
    }, [])

    var result = person.map((p) => {
        return (
            <>
                <div className="row float-start m-2">
                    <div class="card">
                        <img src={logo} class="card-img-top" alt="..." />
                        <div class="card-body text-center">
                            <h5 class="card-title">{p.id}</h5>
                            <h6 class="card-text">{p.name}</h6>
                            <h6 class="card-text">{p.hobby}</h6>
                            <Link to={"/person/"+p.id} className="btn btn-primary">More</Link>
                        </div>
                    </div>
                </div>
            </>
        )
    })

    return (
        <>
            <div><Link to="/person/add" className="btn btn-primary">Add Person</Link></div>
            {result}
            {/* <div className="row float-start mx-2">
                <div class="card">
                    <img src={logo} class="card-img-top" alt="..." />
                    <div class="card-body text-center">
                        <h5 class="card-title">{a[arr].id}</h5>
                        <h6 class="card-text">{a[arr].name}</h6>
                        <h6 class="card-text">{a[arr].hobby}</h6>
                        <a href="#" class="btn btn-primary mb-2" onClick={() => {
                            if (arr == a.length - 1) {
                                setn(0);
                            } else {
                                setn(arr + 1)
                            }
                        }
                        }>next</a><br />
                        <a href="#" class="btn btn-primary" onClick={() => {
                            if (arr < a.length - 2) {
                                setn(a.length - 1);
                            } else {
                                setn(arr - 1)
                            }
                        }
                        }>previous</a>
                    </div>
                </div>
            </div> */}
        </>
    )
}

export default HooksDemo;