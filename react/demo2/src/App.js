import React from 'react';
import logo from './logo.svg';
import './App.css';
import Input from './Input'
class Nav extends React.Component{
  constructor(){
    super()
  }

  render() {
    return  
  }
}

class App extends React.Component{
  constructor(){
    super()

    this.state = {
      like : false
    }
  }

  handleClick(){
    this.setState({like:!this.state.like})
  }

  render() {
    return (
      <div>
        <Input title="输出框" onClick={()=>{console.log("hello")}}></Input>
      </div>
      
    )
  }
}

export default App;
