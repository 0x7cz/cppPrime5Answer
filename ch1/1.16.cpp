#include<iostream>
#include<array>

int main(){
    std::array<int,5> x{1,2,3,4,5};
    for (int i = 0; i < x.size(); i++)
    {
        std::cout << x[i] << std::endl;
    }
    int val=0,sum=0;
    // if (std::cin>>val)
    while (std::cin>>val)
    {
        std::cout << sum <<std::endl;
        sum+=val;
    }
    std::string accept;
    getline(std::cin,accept);
    std::cout << "accept:" <<accept <<std::endl;
    std::cout << sum <<std::endl;
    
    
}