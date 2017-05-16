#!/usr/bin/env bash

# Get the branch name from the environment, defaults to 'dev' if not provided
if [ -z "$BRANCH" ]; then
    BRANCH="R2.0"
fi

if [ -z "$REMOTE" ]; then
    REMOTE="origin"
fi

fetch_on() {

	echo "Change directory: $1"
	cd $1

	echo "Checking out the $BRANCH branch";
	git fetch
	git checkout $BRANCH

}

fetch() {
	echo "Setting up checkout for branch"

	fetch_on $PATH_CK_CENTRAL
	fetch_on $PATH_CK_DOCUMENTDB
	fetch_on $PATH_CK_PRODUCT
	fetch_on $PATH_CK_DISCOVERER
	fetch_on $PATH_CK_CUSTOMER	
	fetch_on $PATH_CK_DISCOVERY_CLIENT
	fetch_on $PATH_CK_DISCOVERY_SERVICE	
	fetch_on $PATH_CK_CENTRAL_SERVICE
	fetch_on $PATH_CK_CENTRAL_CLIENT
	
	echo "Fetch and Checkout Done"	
}

pull_on() {
	echo ""

	fetch_on $1

	echo "Change directory: $1"
	cd $1

	echo "Pulling $BRANCH from $REMOTE for $1" 
	git pull $REMOTE $BRANCH

	echo ""
}

tag_on() {
	echo ""

	fetch_on $1

	echo "Change directory: $1"
	cd $1

	echo "Tag $2 $BRANCH from $REMOTE" 
	git tag -a $2 -m "This release includes: This Release is tag on $2"
	git push $REMOTE $2

	echo ""
}

tag() {
	echo "Tagging for each project"

	tag_on $PATH_CK_CENTRAL $1
	tag_on $PATH_CK_DOCUMENTDB $1
	tag_on $PATH_CK_PRODUCT $1
	tag_on $PATH_CK_DISCOVERER $1
	tag_on $PATH_CK_CUSTOMER $1
	
	echo "All Tagging Done"	
}

push_on() {
	echo ""

	fetch_on $1

	echo "Change directory: $1"
	cd $1
	git add .
	git commit -m "This commit includes: $2"

	echo "Pushing $BRANCH from $REMOTE for $1" 
	git push $REMOTE $BRANCH

	echo ""
}

push() {
	echo "Pushing for each project"

	push_on $PATH_CK_CENTRAL $1
	push_on $PATH_CK_DOCUMENTDB $1 
	push_on $PATH_CK_PRODUCT $1
	push_on $PATH_CK_DISCOVERER $1 
	push_on $PATH_CK_CUSTOMER $1
	push_on $PATH_CK_CENTRAL_SERVICE $1
	push_on $PATH_CK_CENTRAL_CLIENT $1
	
	echo "All Pushing Done"	
}

pull() {
	echo "Pulling for each project"

	pull_on $PATH_CK_CENTRAL
	pull_on $PATH_CK_DOCUMENTDB
	pull_on $PATH_CK_PRODUCT
	pull_on $PATH_CK_DISCOVERER
	pull_on $PATH_CK_CUSTOMER	
	pull_on $PATH_CK_DISCOVERY_CLIENT
	pull_on $PATH_CK_DISCOVERY_SERVICE	
	pull_on $PATH_CK_CENTRAL_SERVICE
	pull_on $PATH_CK_CENTRAL_CLIENT
	
	echo "All Pulling Done"	
}

tag_delete_on() {
	echo ""

	fetch_on $1

	echo "Change directory: $1"
	cd $1

	echo "Tag $2 $BRANCH from $REMOTE" 
	git push origin --delete $2
	git tag -d $2

	echo ""
}

tag_delete() {
	echo "Tag deleting for each project"

	tag_delete_on $PATH_CK_CENTRAL $1
	tag_delete_on $PATH_CK_DOCUMENTDB $1
	tag_delete_on $PATH_CK_PRODUCT $1
	tag_delete_on $PATH_CK_DISCOVERER $1
	tag_delete_on $PATH_CK_CUSTOMER $1
	
	echo "All Tagging Deleted"	
}

#fetch
# Run as per CLI argument
# Usage:
# 	./ck.sh pull
# 	./ck.sh push
$1 $2

