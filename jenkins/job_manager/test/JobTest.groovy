import org.junit.Test
import org.junit.BeforeClass
import groovy.mock.interceptor.MockFor

class JobTest{

    static Branch branchMock
    static Repository repositoryMock

    @BeforeClass
    static void initializeMocks() {
        branchMockContext = new MockFor(Branch)
        repositoryMockContext = new MockFor(Repository)
        repositoryMock = repositoryMockContext.proxyInstance()
        println repositoryMock.name
    }

    @Test
    void dummyTest(){
        assert 1==1
    }

}