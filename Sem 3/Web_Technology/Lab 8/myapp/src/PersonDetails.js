import { useEffect, useState } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";
import logo from './logo.svg';

function PersonDetails() {
    const [person, setPerson] = useState({});
    const { id } = useParams();
    const navigate = useNavigate();

    useEffect(() => {
        let apiUrl = "https://66e8f84c87e417609447a09a.mockapi.io/dhaval/" + id;
        fetch(apiUrl)
            .then((res) => res.json())
            .then((res) => setPerson(res));
    }, []);

    return (
        <>
            <div className="row">
                <div className="col-2">
                    <Link to={"/person"} className="btn btn-primary">Back</Link>
                </div>

                <div className="col-2">
                    <button className="btn btn-danger" onClick={()=>{
                        const apiUrl = "https://66e8f84c87e417609447a09a.mockapi.io/dhaval/" + id;

                        fetch(apiUrl,{method : "DELETE"})
                        .then(res => res.json())
                        .then(res => navigate('/person'));
                    }}>Delete</button>
                </div>
            </div>
            <div className="row float-start m-2">
                <div class="card">
                    <img src={logo} class="card-img-top" alt="..." />
                    <div class="card-body text-center">
                        <h5 class="card-title">{person.id}</h5>
                        <h6 class="card-text">{person.name}</h6>
                        <h6 class="card-text">{person.hobby}</h6>
                    </div>
                </div>
            </div>
        </>
    )
}

export default PersonDetails;