
import styled from "styled-components";
import BlogCommentListItem from "../item/BlogCommentListItem";
const Wrapper = styled.div`
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: center;

    & > * {
        :not(:last-child) {
            margin-bottom: 16px;
        }
    }
`;

const BlogCommentList = ({comments}) => {
    return(
        <Wrapper>
            {
                comments.map((comment, idx) => {
                    return (
                        <BlogCommentListItem    key={comment.id}
                                                comment={comment} />
                    )
                })
            }
        </Wrapper>
    );
}

export default BlogCommentList ;
