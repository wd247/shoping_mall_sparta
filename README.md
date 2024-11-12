git bash로 mkdir shoping_mall_sparta 폴더 생성
폴더 들어가서 dart creat -t console . 초기세팅
--force 사용하라고 떠서
$ dart create -t console . --force 입력
깃허브 레포지토리에 연동하기위해 git init 실행
$ git remote add origin https://github.com/wd247/shoping_mall_sparta.git 실행
git add . 실행
$ git commit -m '스파르타버전' 입력
$ git push 실행했으나 멘트 발생 
fatal: The current branch master has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin master

To have this happen automatically for branches without a tracking
upstream, see 'push.autoSetupRemote' in 'git help config'.
$     git push --set-upstream origin master 실행
깃허브 레포지토리에 커밋 달린거 확인

줄바꿈 테스트