import moment from "moment";
import { latestTimestamp } from "./latestTime";
// Increases testrpc time by the passed duration (a moment.js instance)
export default function increaseTime(duration) {
  const id = Date.now();

  return new Promise((resolve, reject) => {
    web3.currentProvider.sendAsync(
      {
        jsonrpc: "2.0",
        method: "evm_increaseTime",
        params: [duration.asSeconds()],
        id,
      },
      err1 => {
        if (err1) return reject(err1);

        web3.currentProvider.sendAsync(
          {
            jsonrpc: "2.0",
            method: "evm_mine",
            id: id + 1,
          },
          (err2, res) => (err2 ? reject(err2) : resolve(res))
        );
      }
    );
  });
}

// sets time to given timestamp based on current block time
export async function setTimeTo(timestamp) {
  const ct = latestTimestamp();
  if (ct > timestamp) {
    throw new Error(`cannot decrease time to ${timestamp} from ${ct}`);
  }
  return increaseTime(moment.duration(timestamp - ct, "s"));
}
