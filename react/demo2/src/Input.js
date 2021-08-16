import React from 'react';

class Input extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            value: ""
        }
    }

    handleInput(e) {
        console.log(e) 
        this.setState({
            value: e.target.value
        })
    }

    render() {
        return (
            <div>
                <input type="input" onChange={(e) => { this.handleInput(e) }}></input>
                <p>Input的名字是：{this.props.title}}</p>
            </div>

        )
    }
}

export default Input