import React from "react"

class HomePage extends React.Component {
  render() {
    return (
      <div>
        <h1>Welcome to QueryHub!</h1>
        <p>A community application for creating and sharing <a href="https://osquery.io">osquery</a> configuration</p>
        <p>QueryHub is an open-source web application that allows you to curate your own set of queries and packs for your osquery installation.</p>

        <h4>Find recommended queries</h4>
        <p>QueryHub features a list of recommended queries, based on curated lists from contributing organizations and the most popular queries in the QueryHub community.</p>
      </div>
    )
  }
}

export default HomePage;
