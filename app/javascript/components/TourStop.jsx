import React from "react";

export default class TourStop extends React.Component {
  constructor(props){
    super(props);

    this.state = {
      tourInfo: []
    }
    this.componentDidMount = this.componentDidMount.bind(this);
  }

  componentDidMount(){
    fetch('https://evening-retreat-85270.herokuapp.com/organizations/1/tours/1/stops/1').then(results =>{
      return results.json();
    }).then(data =>{
      this.setState({tourInfo: data});
    })
  }


  render(){
    console.log(this.state.tourInfo)
    return(
      <div>
        <div className = 'tourstop-main-photo'>
          <img src = {this.state.tourInfo.image_current}/>
        </div>
        <div className = "tourstop-header-text">
          <h1>{this.state.tourInfo.name}</h1>
        </div>
          <div className = "tourstop-header-links">
            <img src = "https://durhamdill.files.wordpress.com/2017/10/tourify-pin-100px.png" alt = "icon"/>
            <p>{this.state.tourInfo.location} | <a href = {this.state.tourInfo.learn_more_URL}>Website</a></p>

          </div>
          <div className = "tourstop-body">
          <div className = "tourstop-body-text">
            <p>{this.state.tourInfo.description}</p>
          </div>
          <div className = "tourstop-travel-tip">
            <h2>{this.state.tourInfo.travel_tip}</h2>
          </div>
          <div className = "tourstop-footer-links">
            <img src = "https://durhamdill.files.wordpress.com/2017/10/tourify-arrow.png"/>
            <a href = "">TOUR HOME</a>
            <img src = "https://durhamdill.files.wordpress.com/2017/10/tourify-arrow-right.png"/>
          </div>
        </div>
        </div>
    )
  }
}
