/**
*Submitted for verification at BscScan.com on 2025-11-12
*/ 

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20; 

// OpenZeppelin Contracts (last updated v5.0.0) (token/ERC20/IERC20.sol)


/**
* @dev Interface of the ERC-20 standard as defined in the ERC.
*/
interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value); 

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value); 

    /**
     * @dev Returns the value of tokens in existence.
     */
    function totalSupply() external view returns (uint256); 

    /**
     * @dev Returns the value of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256); 

    /**
     * @dev Moves a `value` amount of tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 value) external returns (bool); 

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256); 

    /**
     * @dev Sets a `value` amount of tokens as the allowance of `spender` over the
     * caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 value) external returns (bool); 

    /**
     * @dev Moves a `value` amount of tokens from `from` to `to` using the
     * allowance mechanism. `value` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 value) external returns (bool);
} 

// OpenZeppelin Contracts (last updated v5.0.1) (utils/Context.sol)


/**
* @dev Provides information about the current execution context, including the
* sender of the transaction and its data. While these are generally available
* via msg.sender and msg.data, they should not be accessed in such a direct
* manner, since when dealing with meta-transactions the account sending and
* paying for execution may not be the actual sender (as far as an application
* is concerned).
*
* This contract is only required for intermediate, library-like contracts.
*/
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    } 

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    } 

    function _contextSuffixLength() internal view virtual returns (uint256) {
        return 0;
    }
} 

// OpenZeppelin Contracts (last updated v5.0.0) (token/ERC20/extensions/IERC20Metadata.sol)



/**
* @dev Interface for the optional metadata functions from the ERC-20 standard.
*/
interface IERC20Metadata is IERC20 {
    /**
     * @dev Returns the name of the token.
     */
    function name() external view returns (string memory); 

    /**
     * @dev Returns the symbol of the token.
     */
    function symbol() external view returns (string memory); 

    /**
     * @dev Returns the decimals places of the token.
     */
    function decimals() external view returns (uint8);
} 

// OpenZeppelin Contracts (last updated v5.0.0) (access/Ownable.sol)



/**
* @dev Contract module which provides a basic access control mechanism, where
* there is an account (an owner) that can be granted exclusive access to
* specific functions.
*
* The initial owner is set to the address provided by the deployer. This can
* later be changed with {transferOwnership}.
*
* This module is used through inheritance. It will make available the modifier
* `onlyOwner`, which can be applied to your functions to restrict their use to
* the owner.
*/
abstract contract Ownable is Context {
    address private _owner; 

    /**
     * @dev The caller account is not authorized to perform an operation.
     */
    error OwnableUnauthorizedAccount(address account); 

    /**
     * @dev The owner is not a valid owner account. (eg. `address(0)`)
     */
    error OwnableInvalidOwner(address owner); 

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner); 

    /**
     * @dev Initializes the contract setting the address provided by the deployer as the initial owner.
     */
    constructor(address initialOwner) {
        if (initialOwner == address(0)) {
            revert OwnableInvalidOwner(address(0));
        }
        _transferOwnership(initialOwner);
    } 

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        _checkOwner();
        _;
    } 

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    } 

    /**
     * @dev Throws if the sender is not the owner.
     */
    function _checkOwner() internal view virtual {
        if (owner() != _msgSender()) {
            revert OwnableUnauthorizedAccount(_msgSender());
        }
    } 

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby disabling any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    } 

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        if (newOwner == address(0)) {
            revert OwnableInvalidOwner(address(0));
        }
        _transferOwnership(newOwner);
    } 

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}



contract HeavenDAO is Context, Ownable {
    event ProposalExecuted(
        uint256 indexed proposalId,
        bool[] successes,
        bytes[] returnDatas
    ); 

    enum State {
        Started,
        Successful,
        Failed
    } 

    struct Params {
        address[] targets;
        uint256[] values;
        bytes[] calldatas;
        string description;
    } 

    struct Proposal {
        State state;
        Params params;
        uint256 startDate;
        uint256 endDate;
        uint256 numberOfParticipants;
        uint256 numberOfVotes;
        int256 totalVoteWeight;
    } 

    mapping(uint256 => Proposal) private _proposals; 

    mapping(uint256 => mapping(address => bool)) private _hasVoted;
    mapping(address => mapping(uint256 => bool)) private _votes; 

    address private MLM;
    IERC20Metadata private HVN; 

    uint256 private counter; 

    uint256 private period = 2 days; 

    constructor(address _admin) Ownable(_admin) {
        Proposal storage p = _proposals[0]; 

        p.state = State.Successful;
        p.startDate = block.timestamp;
        p.endDate = block.timestamp;
    } 

    function castVote(bool agree) external returns (bool) {
        address caller = _msgSender();
        storeVote(caller, agree);
        return true;
    } 

    function executeProposal()
        external
        returns (bool[] memory successes, bytes[] memory returnDatas)
    {
        Proposal storage proposal = _proposals[counter]; 

        if (proposal.endDate > block.timestamp) revert("Proposal is active");
        if (proposal.state != State.Started) revert("Proposal has been executed"); 

        uint256 minimumWeight = (HVN.totalSupply() - HVN.balanceOf(MLM)) / 2; 

        if (
            proposal.numberOfVotes > minimumWeight &&
            proposal.totalVoteWeight > 0
        ) {
            proposal.state = State.Successful;
            return executeParams(proposal.params);
        } 

        proposal.state = State.Failed;
    } 

    function setContracts(address _HVN, address _MLM) external onlyOwner {
        HVN = IERC20Metadata(_HVN);
        MLM = _MLM;
    } 

    function setProposalPeriod(uint256 newProposalPeriod) external onlyOwner {
        period = newProposalPeriod;
    } 

    function propose(
        Params memory params
    ) external onlyOwner returns (bool) {
        Proposal memory prevProposal = _proposals[counter];
        counter++;
        Proposal storage proposal = _proposals[counter]; 

        if (prevProposal.endDate > block.timestamp) revert("Last Proposal is active");
        if (prevProposal.state == State.Started) revert("Last Proposal is not executed"); 

        proposal.state = State.Started;
        proposal.params = params;
        proposal.startDate = block.timestamp;
        proposal.endDate = block.timestamp + period; 

        return true;
    } 

    function name() external pure returns (string memory) {
        return "Heaven Decentralized Autonomous Organization";
    } 

    function getProposalCounter() external view returns (uint256) {
        return counter;
    } 

    function getProposal(
        uint256 proposalId
    ) external view returns (Proposal memory) {
        return _proposals[proposalId];
    } 

    function getVote(
        address voter,
        uint256 proposalId
    ) external view returns (bool) {
        return _votes[voter][proposalId];
    } 

    function isVoteActive(address voter) external view returns (bool) {
        Proposal memory proposal = _proposals[counter]; 

        bool isInactive = proposal.state != State.Started;
        bool hasEnded = proposal.endDate < block.timestamp; 

        if (isInactive || hasEnded) return false; 

        return _hasVoted[counter][voter];
    } 

    function hasVoted(
        address voter,
        uint256 proposalId
    ) external view returns (bool) {
        return _hasVoted[proposalId][voter];
    } 

    function getContracts() external view returns (address _HVN, address _MLM) {
        return (address(HVN), MLM);
    } 

    function getProposalPeriod() external view returns (uint256) {
        return period;
    } 

    function executeParams(
        Params memory params
    ) internal returns (bool[] memory successes, bytes[] memory returnDatas) {
        uint256 len = params.targets.length; 

        successes = new bool[](len);
        returnDatas = new bytes[](len); 

        for (uint256 i = 0; i < len; ++i) {
            (successes[i], returnDatas[i]) = params.targets[i].call{
                value: params.values[i]
            }(params.calldatas[i]);
        } 

        emit ProposalExecuted(counter, successes, returnDatas);
    } 

    function storeVote(address voter, bool agree) internal {
        uint256 proposalId = counter;
        Proposal storage proposal = _proposals[proposalId]; 

        if (proposal.endDate < block.timestamp) revert("Proposal is not active"); 

        if (_hasVoted[proposalId][voter]) revert("Caller has already voted"); 

        _hasVoted[proposalId][voter] = true;
        _votes[voter][proposalId] = agree; 

        uint256 HVNbal = HVN.balanceOf(voter); 

        if (HVNbal == 0) revert("Caller needs HVN to vote"); 

        int256 voteVal = int256(HVNbal); 

        proposal.numberOfParticipants += 1;
        proposal.numberOfVotes += HVNbal;
        proposal.totalVoteWeight += (agree ? voteVal : voteVal * -1);
    } 

    receive() external payable {}
}
