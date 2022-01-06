export const shortenAddress = (address) => {
  return address ? `${address.slice(0, 5)}...${address.slice(address.length - 4)}` : '0x...undefined'
}
