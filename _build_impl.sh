APT_REPO=http://mirror.kakao.com/ubuntu/

SHIM_ARCHIVE_URL=https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2
SHIM_ARCHIVE_FILE=shim-15.4.tar.bz2
SHIM_ARCHIVE_SHA256=8344473dd10569588b8238a4656b8fab226714eea9f5363f8c410aa8a5090297

EFIDIR=ZeronsoftN

set -e

${SUDO} docker build --tag=${BUILDING_IMAGE_NAME} \
	--build-arg APT_REPO=${APT_REPO} \
	--build-arg SHIM_ARCHIVE_URL=${SHIM_ARCHIVE_URL} \
	--build-arg SHIM_ARCHIVE_FILE=${SHIM_ARCHIVE_FILE} \
	--build-arg SHIM_ARCHIVE_SHA256=${SHIM_ARCHIVE_SHA256} \
	--build-arg EFIDIR=${EFIDIR} \
	docker

${SUDO} docker run --rm -v ${PWD}/output:/mnt/output ${BUILDING_IMAGE_NAME} sh -c "cp -rf /work/output/output.tar /mnt/output/output.tar"

