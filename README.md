# IP-checker
IP Checker is a Bash tool that checks if an IP address or a list of IP addresses in a file contains a specified keyword in its HTTP response. It is useful for bug bounty hunters and security researchers to quickly identify potential vulnerabilities in web applications.

## Installation

To use IP Checker, you need to have Bash and cURL installed on your system. You can install them using your package manager.



### Usage:
Make the file executable with the command: 

chmod +x ip_check.sh.

Before using ./ip_checker.sh t, it is recommended to first run httpx on the list of ip addresses or a single ip to check if there are any web servers running on the IP addresses then pass is like:

./ip_checker.sh http(s)://IP_ADDRESS KEYWORD

or

cat ips.txt should contains the list of the ip addresses with http(s).


To check a single IP address, run the following command:

./ip_checker.sh IP_ADDRESS KEYWORD

Replace IP_ADDRESS with the IP address you want to check and KEYWORD with the keyword you want to search for in the HTTP response.

To check a list of IP addresses in a file, create a file containing one IP address per line and run the following command:

./ip_checker.sh PATH_TO_IP_FILE KEYWORD

Replace PATH_TO_IP_FILE with the path to the file containing the IP addresses and KEYWORD with the keyword you want to search for in the HTTP response.

### Example:

./ip_checker.sh https://192.168.0.1 Tesla


or

./ip_checker.sh ips.txt Tesla

### How can this tool help you ? 

As a bug bounty hunter, you often need to scan a large number of IP addresses to find vulnerabilities in web applications. This tool can help you quickly check if a specific keyword (e.g. "Tesla") is present in the response of an IP address. This can be useful in several scenarios:

1. Identifying targets: You can use this tool to quickly check if a large number of IP addresses belong to a specific organization or company. For example, if you want to target all IP addresses owned by a company called "ABC Inc.", you can run this tool on a list of IP addresses and search for the keyword "abcinc". This can help you quickly identify potential targets for further testing.

2. Finding hidden web applications: Sometimes, web applications are hosted on IP addresses that are not associated with the main domain. For example, a company might host a web application on an IP address that is used for internal purposes. By running this tool on a range of IP addresses, you can quickly check if any of them return the keyword you're looking for. If you find an IP address with the keyword, it might indicate the presence of a hidden web application that you can further explore.

3. Checking for misconfigurations: Misconfigured web servers can sometimes leak sensitive information in their response headers or body. By running this tool on a list of IP addresses, you can quickly check if any of them return the keyword you're looking for. If you find an IP address with the keyword, it might indicate the presence of a misconfigured web server that you can exploit to gain access to sensitive information.



### Contributing

If you find any bugs or have suggestions for improvements, feel free to open an issue or submit a pull request.
