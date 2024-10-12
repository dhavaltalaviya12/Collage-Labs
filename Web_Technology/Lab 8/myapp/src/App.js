import logo from './logo.svg';

function App() {

  let a = [
    {
      rollNo: 101,
      name: "Dhaval"
    },
    {
      rollNo: 102,
      name: "Nandan"
    },
    {
      rollNo: 103,
      name: "Jevin"
    }
  ]
  var list = a.map((item) => {
    return (
      <div className="row float-start mx-2">
        <div class="card">
          <img src={logo} class="card-img-top" alt="..." />
          <div class="card-body">
            <h5 class="card-title">{item.rollNo}</h5>
            <p class="card-text">{item.name}</p>
            <a href="#" class="btn btn-primary">hello</a>
          </div>
        </div>
      </div>
    )
  }
  )

  return (
    <>
      <h6>{list}</h6>
    </>
  )
}

export default App;
