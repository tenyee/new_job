import React from 'react';
import logo from './logo.svg';
import './App.css';

class Button extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    const themeColor = this.props.themeColor
    return (
      <div>
        <button type="button" style={{ color:themeColor}} onClick={()=>{this.props.onClick('red')}}>红色</button>
        <button type="button" style={{ color:themeColor}} onClick={()=>{this.props.onClick('green')}}>绿色</button>
      </div>

    )
  }
}

class Title extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <h1 style={{color:this.props.themeColor}}>标题</h1>
    )
  }
}

class App extends React.Component {
  constructor(props){
    super(props)

    this.state = {
      themeColor : "red"
    }
  }

  handleClick(color) {
    console.log("app" + color)
    this.setState(
      {
        themeColor : color
      }
    )
  }

  render() {
    return (
      <div className="App">
        <h1>app</h1>
        <Title themeColor={this.state.themeColor}></Title>
        <Button themeColor={this.state.themeColor} onClick={(color)=>this.handleClick(color)}></Button>
      </div>
    );
  }
}

export default App;
