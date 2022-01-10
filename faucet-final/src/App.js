import './App.css';
import Web3 from "web3";
import { useState, useEffect} from 'react';

function App() {
  const [web3Api, setWeb3Api] = useState({
      provider: null,
      web3: null,
  });

  return (
      <div className="faucet-wrapper">
        <div className="faucet">
            <div className="balance-view is-size-2">
                Current Balance: <strong>1 ETH</strong>
            </div>
            <div className="button is-primary mr-5 ">Donate</div>
            <div className="button is-danger">Withdraw</div>
        </div>
      </div>
  );
}

export default App;
