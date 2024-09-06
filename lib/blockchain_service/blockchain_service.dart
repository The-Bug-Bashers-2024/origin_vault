import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class BlockchainService {
  final String rpcUrl = "https://0.0.0.0:7545";
  final String privateKey =
      "0xc61442ba500bb2dac2163c559c80ba1bf346e1400435704f62ef68eca8fa256f";

  late Web3Client ethClient;
  late EthPrivateKey credentials;
  late EthereumAddress contractAddress;
  late DeployedContract contract;

  BlockchainService() {
    // Initialize the Web3 client and credentials
    ethClient = Web3Client(rpcUrl, Client());
    credentials = EthPrivateKey.fromHex(privateKey);
  }

  Future<void> initialize() async {
    // Load the ABI and contract address from the assets
    String abi = await rootBundle
        .loadString("assets/abi.json"); // Ensure the ABI file is in assets
    contractAddress = EthereumAddress.fromHex(
        "<YOUR_CONTRACT_ADDRESS>"); // Replace with deployed contract address

    // Create the contract object
    contract = DeployedContract(
      ContractAbi.fromJson(abi, "YourContractName"),
      contractAddress,
    );
  }

  // Function to create a product (as a farmer)
  Future<String> createProduct(String productName, String originLocation,
      String processingDetails, String ipfsHash) async {
    final createProductFunction = contract.function('createProduct');

    // Call the contract function
    final result = await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: createProductFunction,
        parameters: [productName, originLocation, processingDetails, ipfsHash],
      ),
      chainId: 1337, // Adjust if you're not using Ganache
    );

    return result; // Transaction hash
  }

  // Function to process the product (as a processor)
  Future<String> processProduct(int productId) async {
    final processProductFunction = contract.function('processProduct');

    // Call the contract function
    final result = await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: processProductFunction,
        parameters: [BigInt.from(productId)],
      ),
      chainId: 1337,
    );

    return result;
  }

  // Function to start the product transit (as a transporter)
  Future<String> startTransit(int productId) async {
    final startTransitFunction = contract.function('startTransit');

    final result = await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: startTransitFunction,
        parameters: [BigInt.from(productId)],
      ),
      chainId: 1337,
    );

    return result;
  }

  // Function to mark the product as delivered (as a retailer)
  Future<String> markAsDelivered(int productId) async {
    final markAsDeliveredFunction = contract.function('markAsDelivered');

    final result = await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: markAsDeliveredFunction,
        parameters: [BigInt.from(productId)],
      ),
      chainId: 1337,
    );

    return result;
  }

  // Function to submit a review (as a consumer)
  Future<String> submitReview(int productId, int rating, String review) async {
    final submitReviewFunction = contract.function('submitReview');

    final result = await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: submitReviewFunction,
        parameters: [BigInt.from(productId), BigInt.from(rating), review],
      ),
      chainId: 1337,
    );

    return result;
  }

  // Function to get the product details
  Future<List<dynamic>> getProductDetails(int productId) async {
    final productDetailsFunction = contract.function('productDetails');

    final result = await ethClient.call(
      contract: contract,
      function: productDetailsFunction,
      params: [BigInt.from(productId)],
    );

    return result; // Returns list of product details
  }

  // Function to get the average rating of a product
  Future<BigInt> getAverageRating(int productId) async {
    final getAverageRatingFunction = contract.function('getAverageRating');

    final result = await ethClient.call(
      contract: contract,
      function: getAverageRatingFunction,
      params: [BigInt.from(productId)],
    );

    return result.first as BigInt; // Returns average rating
  }
}
