#include<iostream>
#include<fstream>
#include<sstream>
#include "Sales_item.h"

int main(){
    std::fstream file;
    file.open("/home/imuser/cpp/ch1/sales_record.txt",std::ios::in);
    if(!file){
        std::cerr << "the file is open failure ..." << std::endl;
        exit(0);
    }
    std::string line;
    if(std::getline(file,line)){
        std::string book,author;
        int bookNo;
        std::cout << line << std::endl;
        std::stringstream iss(line);
        iss>>book >> author >> bookNo;
        std::cout << "book: " << book << " author: " << author << " bookNo: " << bookNo << std::endl;
        Sales_item s(book);
        std::cout << s << std::endl;

        Sales_item s1,s2;
        std::cin >> s1 >> s2 ;
        std::cout << s1 + s2 << std::endl;

    }
    file.close();
}