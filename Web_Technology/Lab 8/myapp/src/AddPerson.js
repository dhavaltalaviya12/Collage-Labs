import { useState } from "react";
import { useNavigate } from "react-router-dom";

function AddPerson() {
    const navigate = useNavigate();
    const apiUrl = "https://66e8f84c87e417609447a09a.mockapi.io/dhaval";

    const [data, setData] = useState({ id: "", name: "", hobby: "" });
    return (
        <>
            <div className="container">
                <div className="row">
                    <div className="col-3">Person ID</div>
                    <div className="col">
                        <input type="text" onChange={(e) => {
                            setData({ ...data, id: e.target.value });
                        }} />
                    </div>
                </div>
                <div className="row">
                    <div className="col-3">Person Name</div>
                    <div className="col">
                        <input type="text" onChange={(e) => {
                            setData({ ...data, name: e.target.value });
                        }} />
                    </div>
                </div>
                <div className="row">
                    <div className="col-3">Person Hobby</div>
                    <div className="col">
                        <input type="text" onChange={(e) => {
                            setData({ ...data, hobby: e.target.value });
                        }} />
                    </div>
                </div>

                <input className="btn btn-primary" type="button" value="Add" onClick={() => {
                    fetch(apiUrl, {
                        method: "POST",
                        body: JSON.stringify(data),
                        headers: { "Content-Type": "application/json" }
                    })
                        .then((res) => {
                            navigate('/person');
                        })
                }} />
            </div>
        </>
    )
}

export default AddPerson;